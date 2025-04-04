if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Assume it's a Debian/Ubuntu-based Linux
    echo "deb [trusted=yes] https://apt.fury.io/kurtosis-tech/ /" | sudo tee /etc/apt/sources.list.d/kurtosis.list
    sudo apt update
    sudo apt install kurtosis-cli
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "Detected macOS"
    brew install kurtosis-tech/tap/kurtosis-cli
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi
