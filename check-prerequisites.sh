#!/bin/bash

# YOURS - Prerequisites Check Script
# Run this before setting up the project

echo "🔍 Checking YOURS project prerequisites..."
echo ""

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker: Not installed"
    echo "   Install from: https://docs.docker.com/get-docker/"
fi

# Check Docker Compose
if command -v docker-compose &> /dev/null; then
    echo "✅ Docker Compose: $(docker-compose --version)"
else
    echo "❌ Docker Compose: Not installed"
    echo "   Install from: https://docs.docker.com/compose/install/"
fi

# Check Maven
if command -v mvn &> /dev/null; then
    echo "✅ Maven: $(mvn --version | head -1)"
else
    echo "❌ Maven: Not installed"
    echo "   Install from: https://maven.apache.org/install.html"
    echo "   Or use: brew install maven (macOS) / apt install maven (Ubuntu)"
fi

# Check Git
if command -v git &> /dev/null; then
    echo "✅ Git: $(git --version)"
else
    echo "❌ Git: Not installed"
    echo "   Install from: https://git-scm.com/downloads"
fi

# Check Java (optional, but good to have)
if command -v java &> /dev/null; then
    echo "✅ Java: $(java --version | head -1)"
else
    echo "⚠️  Java: Not installed (Docker will handle this)"
fi

echo ""
echo "🎯 Next steps:"
echo "   1. If all prerequisites are ✅, run: make build"
echo "   2. If any ❌, install the missing tools first"
echo "   3. Then run: make build"
