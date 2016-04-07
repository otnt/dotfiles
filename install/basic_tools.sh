# install basic tools
apt-get update -y -qq && \
apt-get install -y -qq build-essential cmake git python-dev python3-dev wget software-properties-common && \
echo "Basic tools installed: cmake, git, python, wget, other essential tools"

