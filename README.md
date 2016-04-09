# Dotfiles

A dotfile collection for Ubuntu with

1. useful tools with awesome configuration, including vim, tmux, git etc.
2. useful script snippet, including add user, programming language install etc.

# Install

A list of use tools with great configuration. Also feel free to explore the repo to find what you need.

* [Development Environment](###Development Environment)
* [Vim](###Vim)
* [Tmux 2.0](###Tmux 2.0)
* [Docker](###Docker)
* [Language Packages](###Language Packages)
  * [Java SE8](####Java)
  * [Python 2 and Python 3](####Python)
  * [Node.js](####Node.js)
  * [Golang](####Golang)

### Development Environment

This is my personal development environment. It use [Vagrant](https://www.vagrantup.com/) for virtual machine setup, so that you could set your development environment anywhere, anytime, with no human effort, with no error!!!

1. Install Vagrant

Install Vagrant is easy. Follow the [official guide](https://www.vagrantup.com/).

2. Download cofiguration files

```Bash
mkdir workspace
wget https://raw.githubusercontent.com/otnt/dotfiles/master/vagrant/Vagrantfile https://raw.githubusercontent.com/otnt/dotfiles/master/vagrant/bootstrap.sh
```

3. Run Vagrant and enjoy

```Bash
vagrant up
vagrant ssh
```

### Vim

``` Bash
USERNAME=[ENTER YOUR USERNAME HERE]
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/vim.sh | sed -e "s/ubuntu/$USERNAME/g" | sudo /bin/bash
```

### Tmux 2.0

1. Install Tmux

```Bash
USERNAME=[ENTER YOUR USERNAME HERE]
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/tmux.sh | sed -e "s/ubuntu/$USERNAME/g" | sudo /bin/bash
```

2.Open Tmux and Install plugin

```Bash
tmux
```
<kbd>Ctrl</kbd>-<kbd>b</kbd> + <kbd>I</kbd>  (Press <kbd>Ctrl</kbd> and <kbd>b</kbd> together, then press capital <kbd>I</kbd>)

### Docker

1. Install Docker

```Bash
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/docker.sh | sudo /bin/bash
```

2. Add non-root user to docker user group

```Bash
```

### Language Packages

#### Java

```Bash
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/java.sh | sudo /bin/bash
```

#### Python

Install both Python 2 and Python 3

```Bash
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/python.sh | sudo /bin/bash
```

#### Node.js

Install Node.js, npm with most up-to-date version

```Bash
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/node.sh | sudo /bin/bash
```

#### Golang

```Bash
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/golang.sh | sudo /bin/bash
```

# Test

Tested under Ubuntu 14.04

# Feedback

I'm welcome to any feedback. And I will reply within 24 hours.

Have fun!
