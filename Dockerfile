FROM mcr.microsoft.com/dotnet/sdk:8.0

# Set working directory
WORKDIR /app

# Install git and other dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Clone StockSharp repository
RUN git clone https://github.com/StockSharp/StockSharp.git /app/StockSharp

# Set working directory to StockSharp
WORKDIR /app/StockSharp

# Create scripts directory
RUN mkdir -p /app/scripts

# Copy our scripts
COPY build_and_run.sh /app/scripts/
COPY run_sample.sh /app/scripts/
COPY run_linux_samples.sh /app/scripts/

# Make scripts executable
RUN chmod +x /app/scripts/*.sh

# Create a simple startup script
RUN echo '#!/bin/bash' > /app/start.sh && \
    echo 'echo "StockSharp Trading Platform - Docker Edition"' >> /app/start.sh && \
    echo 'echo "============================================="' >> /app/start.sh && \
    echo 'echo ""' >> /app/start.sh && \
    echo 'echo "Available commands:"' >> /app/start.sh && \
    echo 'echo "  ./scripts/build_and_run.sh    - Build all projects"' >> /app/start.sh && \
    echo 'echo "  ./scripts/run_sample.sh <name> - Run specific sample"' >> /app/start.sh && \
    echo 'echo "  ./scripts/run_linux_samples.sh <num> - Run Linux-compatible sample"' >> /app/start.sh && \
    echo 'echo ""' >> /app/start.sh && \
    echo 'echo "Examples:"' >> /app/start.sh && \
    echo 'echo "  ./scripts/run_linux_samples.sh 1  # Storage Random"' >> /app/start.sh && \
    echo 'echo "  ./scripts/run_linux_samples.sh 6  # Console App"' >> /app/start.sh && \
    echo 'echo ""' >> /app/start.sh && \
    echo 'echo "Available Linux samples:"' >> /app/start.sh && \
    echo 'echo "  1. 01_Storage.Random"' >> /app/start.sh && \
    echo 'echo "  2. 02_Storage.Local"' >> /app/start.sh && \
    echo 'echo "  3. 03_Storage.RemoteSource"' >> /app/start.sh && \
    echo 'echo "  4. 05_Storage.HydraServerSaveToLocal"' >> /app/start.sh && \
    echo 'echo "  5. 02_Misc.Unit"' >> /app/start.sh && \
    echo 'echo "  6. 01_CrossPlatform.ConsoleApp"' >> /app/start.sh && \
    echo 'echo ""' >> /app/start.sh && \
    echo 'echo "Starting bash..."' >> /app/start.sh && \
    echo 'bash' >> /app/start.sh && \
    chmod +x /app/start.sh

# Set default command
CMD ["/app/start.sh"]