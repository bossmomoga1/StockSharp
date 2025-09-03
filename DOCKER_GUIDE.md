# 🚀 StockSharp Trading Platform - Docker Guide

## วิธีใช้งานง่ายๆ

### 1. รันแบบเร็ว (แนะนำ)
```bash
./docker_quick.sh
```

### 2. รันแบบเต็ม (ต้อง build image)
```bash
./docker_run.sh
```

### 3. รันด้วยคำสั่ง Docker โดยตรง
```bash
docker run -it --rm mcr.microsoft.com/dotnet/sdk:8.0 bash
```

## 📋 คำสั่งที่ใช้บ่อย

### ใน Docker Container:
```bash
# ตรวจสอบ .NET version
dotnet --version

# Clone StockSharp
git clone https://github.com/StockSharp/StockSharp.git
cd StockSharp

# Build โปรเจกต์
dotnet restore StockSharp.sln
dotnet build StockSharp.sln --configuration Release

# รัน sample ที่ง่ายที่สุด
dotnet run --project Samples/10_CrossPlatform/01_ConsoleApp/01_CrossPlatform.ConsoleApp.csproj
```

## 🎯 Samples ที่แนะนำ

### เริ่มต้น:
- `Samples/10_CrossPlatform/01_ConsoleApp/` - Console App ง่ายๆ
- `Samples/03_Storage/01_Random/` - สร้างข้อมูลสุ่ม
- `Samples/03_Storage/02_Local/` - บันทึกข้อมูลในเครื่อง

### ขั้นกลาง:
- `Samples/06_Strategies/01_HistorySMA/` - กลยุทธ์ SMA
- `Samples/06_Strategies/02_HistoryBollingerBands/` - กลยุทธ์ Bollinger Bands

## ⚠️ ข้อจำกัด

1. **GUI Applications**: ไม่สามารถรันได้ใน Docker
2. **Windows-specific**: บาง samples ใช้ Windows APIs
3. **Connectors**: ต้องตั้งค่าเพิ่มเติมสำหรับการเชื่อมต่อจริง

## 🔧 การแก้ไขปัญหา

### หาก Docker ไม่รัน:
```bash
# เริ่ม Docker
sudo dockerd &

# หรือใช้ service
sudo service docker start
```

### หาก Build ล้มเหลว:
```bash
# ลอง restore packages ใหม่
dotnet restore StockSharp.sln

# ลอง build เฉพาะ project
dotnet build BusinessEntities/BusinessEntities.csproj
```

## 📚 ข้อมูลเพิ่มเติม

- [เอกสารทางการ](https://doc.stocksharp.com)
- [GitHub Repository](https://github.com/StockSharp/StockSharp)
- [YouTube Channel](https://www.youtube.com/@stocksharp)

## 💡 เคล็ดลับ

1. **ใช้ `./docker_quick.sh`** สำหรับการทดสอบเร็ว
2. **เริ่มต้นด้วย Console App** ก่อน
3. **อ่านโค้ดใน Samples** เพื่อเรียนรู้
4. **ทดสอบบนข้อมูลจำลอง** ก่อนใช้ข้อมูลจริง

---

**🎉 ตอนนี้คุณพร้อมใช้งาน StockSharp ใน Docker แล้ว!**