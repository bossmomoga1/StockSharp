#!/bin/bash

echo "🚀 StockSharp Trading Platform - Quick Docker Setup"
echo "=================================================="

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

echo "✅ Docker is running"

# Create a simple script to run inside container
cat > /tmp/stocksharp_setup.sh << 'EOF'
#!/bin/bash
echo "Setting up StockSharp in Docker..."

# Install .NET SDK if not already installed
if ! command -v dotnet &> /dev/null; then
    echo "Installing .NET SDK..."
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    dpkg -i packages-microsoft-prod.deb
    apt-get update
    apt-get install -y dotnet-sdk-8.0
fi

# Clone StockSharp if not exists
if [ ! -d "/tmp/StockSharp" ]; then
    echo "Cloning StockSharp repository..."
    git clone https://github.com/StockSharp/StockSharp.git /tmp/StockSharp
fi

cd /tmp/StockSharp

echo ""
echo "🎯 StockSharp is ready!"
echo "======================"
echo ""
echo "Available commands:"
echo "  dotnet --version                    # Check .NET version"
echo "  ls Samples/                         # List all samples"
echo "  find Samples -name '*.csproj'       # Find all projects"
echo ""
echo "Run a sample:"
echo "  dotnet run --project Samples/10_CrossPlatform/01_ConsoleApp/01_CrossPlatform.ConsoleApp.csproj"
echo ""
echo "Build projects:"
echo "  dotnet restore StockSharp.sln"
echo "  dotnet build StockSharp.sln --configuration Release"
echo ""
echo "Starting bash..."
bash
EOF

chmod +x /tmp/stocksharp_setup.sh

echo "🔨 Starting StockSharp in Docker container..."
echo ""

# Run the container with the setup script
docker run -it --rm \
    -v /tmp/stocksharp_setup.sh:/setup.sh \
    mcr.microsoft.com/dotnet/sdk:8.0 \
    bash -c "apt-get update && apt-get install -y git wget && /setup.sh"