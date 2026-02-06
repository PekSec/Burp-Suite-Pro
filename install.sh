#!/bin/bash

set -e  # Exit on any error

echo "🔧 Starting Burp Suite Professional installation..."
echo ""

echo "📦 Updating package lists..."
sudo apt update || { echo "❌ Failed to update package lists"; exit 1; }

echo "☕ Installing OpenJDK 25..."
sudo apt install openjdk-25-jdk -y || { echo "❌ Failed to install OpenJDK 25"; exit 1; }

echo "📥 Cloning Burp Suite Professional repository..."
if [ -d "Burpsuite-Professional" ]; then
    echo "⚠️  Directory already exists, skipping clone..."
else
    git clone --depth 1 https://github.com/xiv3r/Burpsuite-Professional.git || { echo "❌ Failed to clone repository"; exit 1; }
fi

echo "📂 Entering Burpsuite-Professional directory..."
cd Burpsuite-Professional || { echo "❌ Directory not found"; exit 1; }

echo "🔢 Setting version to 2026..."
version=2026

echo "⬇️  Downloading Burp Suite Pro JAR (version $version)..."
if [ -f "burpsuite_pro_v$version.jar" ]; then
    echo "⚠️  JAR already exists, skipping download..."
else
    wget -O burpsuite_pro_v$version.jar https://github.com/xiv3r/Burpsuite-Professional/releases/download/burpsuite-pro/burpsuite_pro_v$version.jar || { echo "❌ Failed to download JAR"; exit 1; }
fi

echo "🚀 Starting loader in background..."
(java -jar loader.jar) &
sleep 2  # Give loader time to initialize

echo "📝 Creating launch script..."
echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar &" > burpsuitepro

echo "🔐 Making launch script executable..."
chmod +x burpsuitepro

echo "📋 Copying launch script to /bin..."
sudo cp burpsuitepro /bin/burpsuitepro || { echo "❌ Failed to copy script to /bin"; exit 1; }

echo "🔙 Returning to parent directory..."
cd ..

echo ""
echo "✅ Installation complete!"
echo "🚀 Launching Burp Suite Professional..."
echo ""
burpsuitepro
