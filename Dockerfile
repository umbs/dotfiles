# https://github.com/AGhost-7/docker-dev/tree/master/tutorial
# https://www.integralist.co.uk/posts/dev-environments-within-docker-containers/


# FROM ubuntu:bionic

# This installs python base image
FROM python:3.8.0

RUN apt-get update -y
RUN apt-get install -y git ncurses-dev
RUN git clone https://github.com/vim/vim.git && cd vim && \
    ./configure --enable-pythoninterp=yes \
	--enable-python3interp=yes \
	--enable-luainterp \
    && make && make install

# This is needed for vim airline themes and Tmux to work
ENV TERM=screen-256color

# Install sudo command...
RUN apt-get install -y sudo

# Feel free to change this to whatever your want
ENV DOCKER_USER bupadhyayula

# Start by creating our passwordless user.
RUN adduser --disabled-password --gecos '' "$DOCKER_USER"

# Give root priviledges
RUN adduser "$DOCKER_USER" sudo

# Give passwordless sudo. This is only acceptable as it is a private
# development environment not exposed to the outside world. Do NOT do this on
# your host machine or otherwise.
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set the user to be our newly created user by default.
USER "$DOCKER_USER"

# This will determine where we will start when we enter the container.
WORKDIR "/home/$DOCKER_USER"

# The sudo message is annoying, so skip it
RUN touch ~/.sudo_as_admin_successful

# We will need this to build c/c++ dependencies. This is common enough
# in all my various projects that I include it in my base image; there are
# often transitive dependencies in Python/NodeJs/Rust projects which require
# c/c++ compilation.
RUN sudo apt-get install -y build-essential

# The Ubuntu image does not include curl. I prefer it, but it isn't necessary.
# Note that if you decide to not install this you will need to use wget instead
# for some of the installation commands in this tutorial.
RUN sudo apt-get install -y curl

# We will need git so we can clone repositories
RUN sudo apt-get install -y git

# SSH is not bundled by default. I always use ssh to push to Github.
RUN sudo apt-get install -y openssh-client

# The manuals are always handy for development.
RUN sudo apt-get install -y man-db

# Get basic tab completion
RUN sudo apt-get install -y bash-completion

# cscope and ctags
RUN sudo apt-get install -y cscope ctags

# To add addionnal apt repositories, we will require this package.
# RUN sudo apt-get install -y software-properties-common

# You can add new repositories, for instance: neovim
# RUN sudo add-apt-repository ppa:neovim-ppa/unstable

# Update the package listing
# RUN sudo apt-get update

# Install the real deal
# RUN sudo apt-get install neovim -y

# Create configuration directory for neovim
# RUN mkdir -p "$HOME/.config/nvim"

# Install vim-plug, our plugin manager
# RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install all of our plugins
# RUN nvim +PlugInstall +qall

WORKDIR /home/bupadhyayula
