# Navigation
# l = long list; t = time modified; h = human readable (1K, 234M);
# G = don't list group; r = reverse sort;
# p = append '/' indicator to directories
# a = all including . files
# Useful but not included options:
# S = sort by file size; g = don't list owner
# s = size in Kb instead of blocks
# alias ll="ls -ltrhGp"
alias ll="ls -lhGp -color"
# alias ls='ls -hFG -color'
alias p='pwd'
alias hn='hostname'
alias vi='nvim'
alias grep='grep --color'

alias fwaas='cd /Users/bupadhyayula/fwaas/; source .venv/bin/activate'
alias azr='cd /Users/bupadhyayula/fwaas/; source .venv/bin/activate; cd azure'

alias vmseries-credentials='cd ~/gimme-aws-cred/; source .venv/bin/activate; gimme-aws-creds --profile bupadhyayula_sso-admin_vmseries-dev;\
                            cd ~/fwaas/; source .venv/bin/activate'

alias fwaas-dev1-cp-credentials='cd ~/gimme-aws-cred/; source .venv/bin/activate; gimme-aws-creds --profile bupadhyayula_sso-admin_fwaas-dev1-cp;\
                                 cd ~/fwaas/; source .venv/bin/activate'

alias gsl='git shortlog -s -n --all --no-merges'
alias ipy='python3 -m IPython'
alias test_fw='pytest -n 4 tests/test_fw_crud.py'
alias test_one='pytest tests/test_fw_crud.py::test_create_delete_create'
alias aws-cred='cd /Users/bupadhyayula/gimme-aws-creds/; source .venv/bin/activate; gimme-aws-creds --profile bupadhyayula_AWS-Universal-IDP; deactivate; cd ~/fwaas; source .venv/bin/activate'
alias lg='lazygit'
alias obs='cd /Users/bupadhyayula/fwaas/azure/controlplane/functionapps/observability/'
alias lab='cd /Users/bupadhyayula/lab/; source .venv/bin/activate'

# Following works when GNU tools is installed on Mac OSX. The whitespace, \t, \+
# and all are understood by GNU regex parser (I think)
# alias trail_ws="sed -i '' 's/[ \t]\+$//'"

# Following works WITHOUT GNU tools installation, on plain/vanilla Mac OSX
# shell.
alias trail_ws="sed -i '' 's/[[:space:]]\{1,\}$//g'"

alias python="python3"

PROMPT='[%T] '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Autocompletion for homebrew commands
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

setup_local_azure_functions() {
    cd /Users/bupadhyayula/fwaas/azure
    rm -fr .artifacts/
    make sre
    cd .artifacts/deployment/zip; mkdir tmp; cd tmp
    unzip ../app_cp_firewall.zip
    # unzip ../app_mp_subscription.zip
    python3 -m venv .venv; source .venv/bin/activate
    pip install -r requirements.txt
    export NOVA_GCLOUD_PROJECT_ID='its-microsvc'
    export NOVA_GCLOUD_TOPIC_ID_LICENSING='stage_nova_licensing_pubsub'
    export NOVA_API_MARKETPLACE_ACCOUNTS='https://nova-licensing-stage.api.paloaltonetworks.com/marketplace/v1/accounts'
    export CLOUDNGFW_GCLOUD_PROJECT_ID='cloudngfw-nonprod'
    export CLOUDNGFW_GCLOUD_TOPIC_ENTITLEMENT_SUBSCRIPTION_ID='sub-entitlement-cloudngfw-qa'
    func start
}

azure_csp_functions() {
    cd /Users/bupadhyayula/lab
    source .venv/bin/activate
    python cosmosdb_utils.py
    cd /Users/bupadhyayula/fwaas/azure
    source ../.venv/bin/activate
    make sre
    cd .artifacts/deployment/zip
    mkdir publisher
    cd publisher
    unzip ../app_mp_subscription.zip
    cp /Users/bupadhyayula/fwaas/cloudngfw_gcloud_sa_creds.json .
    echo "****************   PUBLISHING    **************************"
    PYTHONPATH=. PLATFORM=Azure NOVA_GCLOUD_PROJECT_ID='its-microsvcs' NOVA_GCLOUD_TOPIC_ID_LICENSING='stage_nova_licensing_pubsub' python azure/management/functionapps/mpsubscription/functions/subscription/__init__.py
    echo "****************   LISTETNING    **************************"
    PYTHONPATH=. PLATFORM=Azure NOVA_API_MARKETPLACE_ACCOUNTS='https://nova-licensing-stage.api.paloaltonetworks.com/marketplace/v1/accounts' CLOUDNGFW_GCLOUD_TOPIC_ENTITLEMENT_SUBSCRIPTION_ID='sub-entitlement-cloudngfw-qa' CLOUDNGFW_GCLOUD_PROJECT_ID='cloudngfw-nonprod' python azure/management/functionapps/mpsubscription/functions/tenantmgmt/__init__.py
}

debug_azure_function() {
    cd /Users/bupadhyayula/fwaas/azure
    source ../.venv/bin/activate
    # make sre
    make
    cd .artifacts/deployment/zip
    mkdir tmp
    cd tmp
    unzip ../app_cp_firewall.zip
    PYTHONPATH=. PLATFORM=Azure NOVA_GCLOUD_PROJECT_ID='its-microsvcs' NOVA_GCLOUD_TOPIC_ID_LICENSING='stage_nova_licensing_pubsub' python azure/controlplane/functionapps/firewall/functions/FirewallCRUD/__init__.py
}
export PATH="/usr/local/sbin:$PATH"
