# 🔥 Burp Suite Professional

## 📋 Overview

This script automates the installation and configuration of Burp Suite Professional on Debian/Ubuntu-based Linux systems. It handles all dependencies, downloads the required files, and sets up a global launch command.

## ⚙️ Features

- ✅ Automatic dependency installation (OpenJDK 25)
- ✅ Repository cloning and setup
- ✅ Burp Suite Pro JAR download
- ✅ Loader configuration with proper Java flags
- ✅ Global command (`burpsuitepro`) for easy launching
- ✅ Error handling and status messages
- ✅ Skip already completed steps on re-run

## 🛠️ Prerequisites

- Debian/Ubuntu-based Linux distribution
- `sudo` privileges
- Active internet connection
- `git`, `wget`, and `apt` package manager

## 📥 Installation

### Method 1: Direct Download & Execute
```bash
wget https://raw.githubusercontent.com/PekSec/Burp-Suite-Pro/main/install.sh
chmod +x install.sh
./install.sh
```

### Method 2: Clone Repository
```bash
git clone https://github.com/PekSec/Burp-Suite-Pro.git
cd Burp-Suite-Pro
chmod +x install.sh
./install.sh
```

## 🚀 Usage

### First Time Installation

Run the script:
```bash
./install.sh
```

The script will:
1. Update package lists
2. Install OpenJDK 25
3. Clone the Burp Suite Professional repository
4. Download Burp Suite Pro JAR (version 2026)
5. Start the loader in the background
6. Create and install a global launch script
7. Launch Burp Suite Professional

### Launching After Installation

Simply run from anywhere:
```bash
burpsuitepro
```

## 📂 File Locations

| Component | Location |
|-----------|----------|
| Installation Directory | `./Burpsuite-Professional/` |
| Burp Suite JAR | `./Burpsuite-Professional/burpsuite_pro_v2026.jar` |
| Loader | `./Burpsuite-Professional/loader.jar` |
| Launch Script | `/bin/burpsuitepro` |

## 🔧 Troubleshooting

### Java Version Issues

If you encounter Java-related errors:
```bash
java -version  # Should show OpenJDK 25
update-alternatives --config java  # Select OpenJDK 25 if multiple versions exist
```

### Permission Denied

Ensure the script is executable:
```bash
chmod +x install.sh
```

### Loader Not Starting

Check if Java is properly installed:
```bash
which java
java -jar Burpsuite-Professional/loader.jar
```

### Port Already in Use

If the loader port is occupied:
```bash
lsof -i :8080  # Check what's using the port
kill -9 <PID>  # Kill the process if needed
```

## 🗑️ Uninstallation

To remove Burp Suite Professional:
```bash
# Remove global launch script
sudo rm /bin/burpsuitepro

# Remove installation directory
rm -rf Burpsuite-Professional

# (Optional) Remove OpenJDK 25
sudo apt remove openjdk-25-jdk -y
sudo apt autoremove -y
```

## ⚠️ Important Notes

- This script uses a **modified version** of Burp Suite Professional with a loader
- Ensure you comply with PortSwigger's licensing terms
- For legitimate penetration testing and authorized security assessments only
- The loader runs in the background and must be active for Burp Suite to function

## 📝 Script Workflow
```
┌─────────────────────────────────┐
│  Update Package Lists           │
└──────────┬──────────────────────┘
           │
┌──────────▼──────────────────────┐
│  Install OpenJDK 25             │
└──────────┬──────────────────────┘
           │
┌──────────▼──────────────────────┐
│  Clone Repository               │
└──────────┬──────────────────────┘
           │
┌──────────▼──────────────────────┐
│  Download Burp Suite JAR        │
└──────────┬──────────────────────┘
           │
┌──────────▼──────────────────────┐
│  Start Loader (Background)      │
└──────────┬──────────────────────┘
           │
┌──────────▼──────────────────────┐
│  Create Launch Script           │
└──────────┬──────────────────────┘
           │
┌──────────▼──────────────────────┐
│  Install to /bin                │
└──────────┬──────────────────────┘
           │
┌──────────▼──────────────────────┐
│  Launch Burp Suite Pro          │
└─────────────────────────────────┘
```

## 🤝 Credits

- Original repository: [xiv3r/Burpsuite-Professional](https://github.com/xiv3r/Burpsuite-Professional)
- Script cleanup and improvements: [PekSec](https://github.com/PekSec)

## 📄 License

This script is provided as-is for educational and authorized security testing purposes only.

## 🔗 Links

- [Burp Suite Official](https://portswigger.net/burp)
- [Original Repository](https://github.com/xiv3r/Burpsuite-Professional)
- [This Repository](https://github.com/PekSec/Burp-Suite-Pro)
- [Report Issues](https://github.com/PekSec/Burp-Suite-Pro/issues)

---

**⚡ Quick Start:**
```bash
wget https://raw.githubusercontent.com/PekSec/Burp-Suite-Pro/main/install.sh && chmod +x install.sh && ./install.sh
```
