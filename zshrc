eval export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"; export PATH;
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
eval export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"; export PATH;
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
eval 



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

alias iron='set_go_env && cd /Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/ironvault'
alias zyc='set_go_env && cd /Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/sase-accl-controller'
alias com='set_go_env && cd /Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/sase-accl-common'
alias zgw='set_go_env && cd /Users/bupadhyayula/go/src/zycada-edge-platform/data-plane/zgw'
alias zcfg='set_go_env && cd /Users/bupadhyayula/go/src/zycada-edge-platform/data-plane/zcfg'
alias goinstall='go install ./...'
alias pra='set_go_env && cd /Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/pra-cfg'
alias pcom='set_go_env && cd /Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/pra-common'


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

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

function set_go_env() { 
	export GONOPROXY=code.pan.run
	export GOPRIVATE=code.pan.run
	export GOPROXY=https://art.code.pan.run/artifactory/api/go/go-prisma-access
	export GOROOT=/opt/homebrew/Cellar/go/1.25.0/libexec
	export GO111MODULE=on
	export GOPATH=/Users/bupadhyayula/go/src
	export GOFLAGS="-gcflags=-N"
	export GOOGLE_APPLICATION_CREDENTIALS="/Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/pa-sase-insights-dev-02-5d477bca4ec6.json" && echo "Go env set!";
}

setup_mtlsproxy() {
    local env=$1
    
    # Validate input
    if [[ ! "$env" =~ ^(dev02|dev03|qa01|qa03)$ ]]; then
        echo "Error: Invalid environment. Please use one of: dev02, dev03, qa01, qa03"
        return 1
    fi
    
    # Check if any of the proxy ports are already in use
    local ports=(8081 8082 8083)
    local running_ports=()
    
    for port in "${ports[@]}"; do
        if lsof -i :$port >/dev/null 2>&1; then
            running_ports+=($port)
        fi
    done
    
    # If any ports are in use, reject the request
    if [[ ${#running_ports[@]} -gt 0 ]]; then
        echo "Error: mTLS proxy is already running!"
        echo "The following ports are in use: ${running_ports[*]}"
        echo "Please stop the existing proxy services before starting new ones."
        echo ""
        echo "To stop existing services, you can:"
        echo "1. Kill processes using these ports:"
        for port in "${running_ports[@]}"; do
            local pid=$(lsof -ti :$port)
            if [[ -n "$pid" ]]; then
                echo "   kill $pid  # (port $port)"
            fi
        done
        echo "2. Or use: pkill -f 'go run main.go.*mtlsproxy'"
        return 1
    fi
    
    # Set URLs based on environment
    local origin1="https://pa-service-api-us-${env}.tools.panclouddev.com:443"
    local origin2="https://${env}.panclouddev.com"
    local origin3="https://pa-service-api-us-${env}.tools.panclouddev.com:443"
    
    # Split window into 3 panes
    tmux split-window -v
    tmux split-window -v
    # Make all panes equal size
    tmux select-layout even-vertical
    tmux select-pane -t 0 # Go back to first pane
        
    # Pane 0 (top): Go to directory and run command
    tmux send-keys -t 0 "cd /Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/sase-accl-controller/dev_tools/mtlsproxy" Enter
    tmux send-keys -t 0 "go run main.go -addr 127.0.0.1:8081 -origin $origin1 -cert ~/.certs/zorchestrator-service-cert -key ~/.certs/zorchestrator-service-key" Enter
        
    # Pane 1 (middle): Go to directory and run command      
    tmux send-keys -t 1 "cd /Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/sase-accl-controller/dev_tools/mtlsproxy" Enter
    tmux send-keys -t 1 "go run main.go -addr 127.0.0.1:8082 -origin $origin2 -cert ~/.certs/zorchestrator-service-cert -key ~/.certs/zorchestrator-service-key" Enter
        
    # Pane 2 (bottom): Go to directory and run command
    tmux send-keys -t 2 "cd /Users/bupadhyayula/go/src/code.pan.run/prisma-access/sase-cosmos-group/sase-accl-group/sase-accl-controller/dev_tools/mtlsproxy" Enter
    tmux send-keys -t 2 "go run main.go -addr 127.0.0.1:8083 -origin $origin3 -cert ~/.certs/zorchestrator-service-cert -key ~/.certs/zorchestrator-service-key" Enter
    
    echo "mTLS proxy setup complete for environment: $env"
    echo "Services running on ports: ${ports[*]}"
}

# Helper function to stop all proxy services
stop_mtlsproxy() {
    echo "Stopping mTLS proxy services..."
    pkill -f 'go run main.go.*mtlsproxy' 2>/dev/null
    
    # Wait a moment and check if ports are freed
    sleep 2
    local ports=(8081 8082 8083)
    local still_running=()
    
    for port in "${ports[@]}"; do
        if lsof -i :$port >/dev/null 2>&1; then
            still_running+=($port)
        fi
    done
    
    if [[ ${#still_running[@]} -eq 0 ]]; then
        echo "All mTLS proxy services stopped successfully."
    else
        echo "Warning: Some services may still be running on ports: ${still_running[*]}"
        echo "You may need to manually kill them."
    fi
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/bupadhyayula/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
