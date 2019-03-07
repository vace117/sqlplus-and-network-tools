# Description

This Docker image contains SQL*Plus Tool (Version 12.2.0.1.0) and some useful network utilities. You can use this image instead of installing the Oracle Instant Client manually.

## Installation

### Pull the Image

```bash
docker pull vace117/sqlplus-and-network-tools
```

### Install Wrapper Script

```bash

```

## Usage Example

```bash
docker run -it --net host vace117/sqlplus-and-network-tools sys/password1@localhost:15210/ORCLPDB1.localdomain as sysdba
```