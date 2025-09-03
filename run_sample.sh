#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: $0 <sample_name>"
    echo "Example: $0 01_Basic.ConnectAndDownloadInstruments"
    exit 1
fi
sample_name=$1
project_path=$(find Samples -name "${sample_name}.csproj" -type f)
if [ -z "$project_path" ]; then
    echo "Sample project $sample_name not found!"
    exit 1
fi
echo "Running sample: $sample_name"
dotnet run --project "$project_path"
