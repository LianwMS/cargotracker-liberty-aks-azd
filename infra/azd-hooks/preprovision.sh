#!/bin/bash

azd config set alpha.aks.helm on
export HELM_REPO_URL="https://azure-javaee.github.io/cargotracker-liberty-aks"
export HELM_REPO_NAME="cargotracker-liberty-aks"
helm repo add ${HELM_REPO_NAME} ${HELM_REPO_URL}

# Function to check if a command exists
check_command() {
    local cmd=$1
    local install_msg=$2

    if ! command -v "$cmd" &> /dev/null; then
        echo "❌ $cmd is not installed"
        echo "To install $cmd: $install_msg"
        error=1
    else
        echo "✅ $cmd is installed"
    fi
}

# Check Maven
check_command "mvn" "Visit https://maven.apache.org/install.html for installation instructions"

# Check Azure CLI
check_command "az" "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash"

# Check Git
check_command "git" "sudo apt-get install git # For Ubuntu/Debian\nbrew install git # For macOS"

# Check kubectl
check_command "kubectl" "Visit https://kubernetes.io/docs/tasks/tools/install-kubectl/ for installation instructions"

# Check helm
check_command "helm" "Visit https://helm.sh/docs/intro/install/ for installation instructions"

# Exit with error if any tool is missing
if [ -n "$error" ] && [ "$error" -eq 1 ]; then
    echo -e "\n⚠️  Please install the missing tools before proceeding."
    exit 1
fi

echo -e "\n✅ All required tools are installed!"
