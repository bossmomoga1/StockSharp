#!/bin/bash

echo "🚀 StockSharp Trading Platform - Docker Edition"
echo "=============================================="

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

echo "✅ Docker is running"

# Build the Docker image
echo "🔨 Building StockSharp Docker image..."
docker build -t stocksharp:latest .

if [ $? -eq 0 ]; then
    echo "✅ Docker image built successfully!"
    echo ""
    echo "🎯 To run StockSharp in Docker:"
    echo "   docker run -it --rm stocksharp:latest"
    echo ""
    echo "📋 Available commands inside Docker:"
    echo "   ./scripts/run_linux_samples.sh 1  # Storage Random"
    echo "   ./scripts/run_linux_samples.sh 2  # Storage Local"
    echo "   ./scripts/run_linux_samples.sh 6  # Console App"
    echo ""
    echo "🚀 Starting StockSharp Docker container..."
    echo ""
    docker run -it --rm stocksharp:latest
else
    echo "❌ Failed to build Docker image"
    exit 1
fi