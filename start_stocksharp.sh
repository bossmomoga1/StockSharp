#!/bin/bash

echo "🚀 StockSharp Trading Platform - Quick Start"
echo "==========================================="

# Check if we're in the StockSharp directory
if [ ! -f "StockSharp.sln" ]; then
    echo "❌ Please run this script from the StockSharp directory"
    echo "   Current directory: $(pwd)"
    echo ""
    echo "To fix this:"
    echo "   cd /path/to/StockSharp"
    echo "   ./start_stocksharp.sh"
    exit 1
fi

echo "✅ Found StockSharp.sln"

# Check .NET SDK
if ! command -v dotnet &> /dev/null; then
    echo "❌ .NET SDK not found. Please install .NET SDK 8.0 first."
    exit 1
fi

echo "✅ .NET SDK version: $(dotnet --version)"

echo ""
echo "🎯 Available options:"
echo "===================="
echo "1. Build and run all projects"
echo "2. Run a specific sample"
echo "3. List all samples"
echo "4. Run Linux-compatible samples only"
echo "5. Exit"
echo ""

read -p "Choose an option (1-5): " choice

case $choice in
    1)
        echo "🔨 Building all projects..."
        dotnet restore StockSharp.sln
        dotnet build StockSharp.sln --configuration Release
        ;;
    2)
        echo "📋 Available samples:"
        find Samples -name "*.csproj" | head -20
        echo "..."
        read -p "Enter sample name (e.g., 01_CrossPlatform.ConsoleApp): " sample_name
        if [ -n "$sample_name" ]; then
            project_path=$(find Samples -name "${sample_name}.csproj" -type f)
            if [ -n "$project_path" ]; then
                echo "🚀 Running $sample_name..."
                dotnet run --project "$project_path"
            else
                echo "❌ Sample not found: $sample_name"
            fi
        fi
        ;;
    3)
        echo "📋 All samples:"
        find Samples -name "*.csproj" | while read -r project; do
            project_name=$(basename "$project" .csproj)
            echo "  • $project_name"
        done
        ;;
    4)
        echo "🐧 Linux-compatible samples:"
        echo "  1. 01_Storage.Random"
        echo "  2. 02_Storage.Local"
        echo "  3. 03_Storage.RemoteSource"
        echo "  4. 05_Storage.HydraServerSaveToLocal"
        echo "  5. 02_Misc.Unit"
        echo "  6. 01_CrossPlatform.ConsoleApp"
        echo ""
        read -p "Choose a sample (1-6): " linux_choice
        case $linux_choice in
            1) dotnet run --project Samples/03_Storage/01_Random/01_Storage.Random.csproj ;;
            2) dotnet run --project Samples/03_Storage/02_Local/02_Storage.Local.csproj ;;
            3) dotnet run --project Samples/03_Storage/03_RemoteSource/03_Storage.RemoteSource.csproj ;;
            4) dotnet run --project Samples/03_Storage/05_HydraServerSaveToLocal/05_Storage.HydraServerSaveToLocal.csproj ;;
            5) dotnet run --project Samples/08_Misc/02_Unit/02_Misc.Unit.csproj ;;
            6) dotnet run --project Samples/10_CrossPlatform/01_ConsoleApp/01_CrossPlatform.ConsoleApp.csproj ;;
            *) echo "Invalid choice" ;;
        esac
        ;;
    5)
        echo "👋 Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

echo ""
echo "🎉 Done!"