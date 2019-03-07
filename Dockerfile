FROM ubuntu:bionic

LABEL org.label-schema.version="12.2.0.1.0"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="SQL*Plus: Release 12.2.0.1.0 Production"
LABEL org.label-schema.description="SQL*Plus Tool and some useful network utilities"
LABEL org.label-schema.url="https://github.com/vace117/sqlplus-and-network-tools.git"
LABEL org.label-schema.docker.cmd="docker run -it --net host vace117/sqlplus-and-network-tools user/pass@host:port/Service_Name"
LABEL org.label-schema.vendor="vace117"

RUN apt-get update && apt-get install -y --no-install-recommends \
        inetutils-telnet \
        net-tools \
        iputils-ping \
        traceroute \
        libaio1 \
        rlwrap \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y

# Install Oracle Instant Client and SQLPlus binary
#
COPY sqlplus_packages/ /root/sqlplus_packages
RUN cd /root/sqlplus_packages \
        && dpkg -i *.deb \
        && ln -s /usr/bin/sqlplus64 /usr/bin/sqlplus \
        && echo "/usr/lib/oracle/12.2/client64/lib" >> /etc/ld.so.conf.d/oracle.conf \
        && chmod o+r /etc/ld.so.conf.d/oracle.conf \
        && ldconfig \
        && rm -rf /root/sqlplus_packages

ENTRYPOINT ["/usr/bin/sqlplus"]