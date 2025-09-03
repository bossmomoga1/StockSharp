#!/bin/bash
echo "StockSharp - Linux Sample Runner"
echo "Available Linux-compatible samples:"
echo "1. 01_Storage.Random"
echo "2. 02_Storage.Local"
echo "3. 03_Storage.RemoteSource"
echo "4. 05_Storage.HydraServerSaveToLocal"
echo "5. 02_Misc.Unit"
echo "6. 01_CrossPlatform.ConsoleApp"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <sample_number>"
    exit 1
fi
case $1 in
    1) dotnet run --project Samples/03_Storage/01_Random/01_Storage.Random.csproj ;;
    2) dotnet run --project Samples/03_Storage/02_Local/02_Storage.Local.csproj ;;
    3) dotnet run --project Samples/03_Storage/03_RemoteSource/03_Storage.RemoteSource.csproj ;;
    4) dotnet run --project Samples/03_Storage/05_HydraServerSaveToLocal/05_Storage.HydraServerSaveToLocal.csproj ;;
    5) dotnet run --project Samples/08_Misc/02_Unit/02_Misc.Unit.csproj ;;
    6) dotnet run --project Samples/10_CrossPlatform/01_ConsoleApp/01_CrossPlatform.ConsoleApp.csproj ;;
    *) echo "Invalid sample number. Please choose 1-6." ;;
esac
