#!/bin/bash
echo "StockSharp Trading Platform - Build and Run Script"
echo "=================================================="
if ! command -v dotnet &> /dev/null; then
    echo ".NET SDK is not installed. Please install .NET SDK first."
    exit 1
fi
echo ".NET SDK version: $(dotnet --version)"
echo "Cleaning previous builds..."
dotnet clean StockSharp.sln
echo "Restoring NuGet packages..."
dotnet restore StockSharp.sln
echo "Building StockSharp solution..."
dotnet build StockSharp.sln --configuration Release --no-restore
if [ $? -eq 0 ]; then
    echo "Build completed successfully!"
    echo ""
    echo "Available Sample Projects:"
    echo "=============================="
    find Samples -name "*.csproj" -type f | while read -r project; do
        project_name=$(basename "$project" .csproj)
        echo "  • $project_name"
    done
else
    echo "Build failed!"
    exit 1
fi
