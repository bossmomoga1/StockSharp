#!/bin/bash
echo "StockSharp - Linux Build Script"
echo "Building only Linux-compatible projects..."
dotnet restore BusinessEntities/BusinessEntities.csproj
dotnet restore Messages/Messages.csproj
dotnet restore Algo/Algo.csproj
dotnet build BusinessEntities/BusinessEntities.csproj --configuration Release
dotnet build Messages/Messages.csproj --configuration Release
dotnet build Algo/Algo.csproj --configuration Release
echo "Build completed!"
