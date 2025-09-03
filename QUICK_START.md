# 🚀 StockSharp Trading Platform - Quick Start Guide

## วิธีใช้งานง่ายๆ

### 1. เริ่มต้นใช้งาน (แนะนำ)
```bash
./start_stocksharp.sh
```

### 2. รัน sample ที่ง่ายที่สุด
```bash
dotnet run --project Samples/10_CrossPlatform/01_ConsoleApp/01_CrossPlatform.ConsoleApp.csproj
```

### 3. รัน Linux-compatible samples
```bash
# Storage Random
dotnet run --project Samples/03_Storage/01_Random/01_Storage.Random.csproj

# Storage Local
dotnet run --project Samples/03_Storage/02_Local/02_Storage.Local.csproj

# Console App
dotnet run --project Samples/10_CrossPlatform/01_ConsoleApp/01_CrossPlatform.ConsoleApp.csproj
```

## 📋 คำสั่งพื้นฐาน

### ตรวจสอบสถานะ:
```bash
dotnet --version                    # ตรวจสอบ .NET version
ls Samples/                         # ดู samples ทั้งหมด
find Samples -name "*.csproj"       # หา projects ทั้งหมด
```

### Build โปรเจกต์:
```bash
dotnet restore StockSharp.sln       # Restore packages
dotnet build StockSharp.sln         # Build โปรเจกต์
```

### รัน samples:
```bash
dotnet run --project <project_path>  # รัน project
```

## 🎯 Samples ที่แนะนำ

### สำหรับผู้เริ่มต้น:
1. **01_CrossPlatform.ConsoleApp** - Console App ง่ายๆ
2. **01_Storage.Random** - สร้างข้อมูลสุ่ม
3. **02_Storage.Local** - บันทึกข้อมูลในเครื่อง

### สำหรับผู้มีประสบการณ์:
1. **01_Strategies.HistorySMA** - กลยุทธ์ SMA
2. **02_Strategies.HistoryBollingerBands** - กลยุทธ์ Bollinger Bands
3. **01_Indicators.SimpleSMA** - Simple Moving Average Indicator

## ⚠️ ข้อจำกัด

1. **GUI Applications**: ไม่สามารถรันได้บน Linux
2. **Windows-specific**: บาง samples ใช้ Windows APIs
3. **Connectors**: ต้องตั้งค่าเพิ่มเติมสำหรับการเชื่อมต่อจริง

## 🔧 การแก้ไขปัญหา

### หาก .NET SDK ไม่มี:
```bash
# ติดตั้ง .NET SDK 8.0
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y dotnet-sdk-8.0
```

### หาก Build ล้มเหลว:
```bash
# ลอง restore packages ใหม่
dotnet restore StockSharp.sln

# ลอง build เฉพาะ project
dotnet build BusinessEntities/BusinessEntities.csproj
```

### หาก Sample ไม่รัน:
```bash
# ตรวจสอบ dependencies
dotnet list package

# ลองรัน sample ที่ง่ายที่สุด
dotnet run --project Samples/10_CrossPlatform/01_ConsoleApp/01_CrossPlatform.ConsoleApp.csproj
```

## 📚 เรียนรู้เพิ่มเติม

### เอกสาร:
- [เอกสารทางการ](https://doc.stocksharp.com)
- [GitHub Repository](https://github.com/StockSharp/StockSharp)
- [YouTube Channel](https://www.youtube.com/@stocksharp)

### ตัวอย่างโค้ด:
- ดูในโฟลเดอร์ `Samples/`
- อ่านไฟล์ `Program.cs` ในแต่ละ sample
- ดูการใช้งาน API ใน `Algo/` folder

## 💡 เคล็ดลับ

1. **เริ่มต้นด้วย Console App** ก่อน
2. **อ่านโค้ดใน Samples** เพื่อเรียนรู้การใช้งาน
3. **ทดสอบบนข้อมูลจำลอง** ก่อนใช้ข้อมูลจริง
4. **ใช้ Visual Studio** สำหรับการพัฒนา (Windows)

## 🎉 เริ่มต้นใช้งาน

```bash
# 1. รัน script ง่ายๆ
./start_stocksharp.sh

# 2. เลือก option 4 (Linux-compatible samples)
# 3. เลือก sample ที่ต้องการ
# 4. เริ่มเรียนรู้!
```

---

**🎯 ตอนนี้คุณพร้อมใช้งาน StockSharp แล้ว!**