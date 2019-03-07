# Description

This Docker image contains SQL*Plus Tool (Version 12.2.0.1.0) and some useful network utilities. You can use this image instead of installing the Oracle Instant Client manually.

## Installation

### Pull the Image

```bash
docker pull vace117/sqlplus-and-network-tools
```

### Install Wrapper Script

```bash
sudo wget -P /usr/local/bin https://raw.githubusercontent.com/vace117/sqlplus-and-network-tools/master/sqlplus.sh; sudo chmod +x /usr/local/bin/sqlplus.sh
```

## Usage Examples

You can use the wraper script:

```bash
sqlplus.sh sys/password1@localhost:15210/ORCLPDB1.localdomain as sysdba
```

Or execute the image directly:

```bash
docker run -it --net host vace117/sqlplus-and-network-tools sys/password1@localhost:15210/ORCLPDB1.localdomain as sysdba
```

To get a shell inside this container:

```bash
docker run -it --net host --entrypoint bash vace117/sqlplus-and-network-tools
```