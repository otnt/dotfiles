FROM ubuntu
MAINTAINER Pufan Jiang<jiangpufan@gmail.com>

RUN apt-get update -y && apt-get install -y curl
RUN curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/vim.sh | /bin/bash

CMD ["vim"]

