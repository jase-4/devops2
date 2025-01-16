# Use an Ubuntu base image
FROM ubuntu:20.04

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    build-essential \
    gcc \
    wget \
    curl \
    python3.9 \
    python3.9-venv \
    python3.9-dev \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set Python3.9 as the default python3
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Verify installation
RUN python3 --version && gcc --version
RUN python3 -m pip install --upgrade pip setuptools cython

# Set up a working directory
WORKDIR /app

# Copy project files (if any)
COPY . .

# Compile the C file
RUN gcc -o main main.c
RUN python3 setup.py build_ext --inplace

# Specify the default command to run the compiled C program
CMD ["python3", "rect.py"]
