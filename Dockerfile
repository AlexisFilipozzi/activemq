FROM openjdk:8-jre

ENV ACTIVEMQ_CONFIG_DIR /opt/activemq/conf.tmp
ENV ACTIVEMQ_DATA_DIR /data/activemq
ENV ACTIVEMQ_VERSION 5.14.5
ENV ACTIVEMQ_HOME /opt/activemq
ENV SETUP_DIR /app/setup
ENV LOG_DIR /var/log
ENV DATA_DIR /data

# Update distro and install some packages
RUN apt-get update && \
    apt-get install -y python \ 
        python-pip \
        vim \
        curl \
        locales &&\
     update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    rm -rf /var/lib/apt/lists/*

# Install stompy
RUN pip install stomp.py

# Install activemq
WORKDIR /usr/src
RUN curl -LO http://apache.mirrors.ovh.net/ftp.apache.org/dist/activemq/${ACTIVEMQ_VERSION}/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz
RUN tar -xvzf apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz
WORKDIR ${ACTIVEMQ_HOME}
RUN mv /usr/src/apache-activemq-${ACTIVEMQ_VERSION}/* ${ACTIVEMQ_HOME}
RUN rm -rf /usr/src/*

# create activemq dir
WORKDIR /data/activemq
WORKDIR /var/log/activemq

# Copy the app setting
COPY assets/entrypoint /app/
COPY assets/run.sh /app/run.sh
RUN chmod +x /app/run.sh

# Expose all port
EXPOSE 8161
EXPOSE 61616
EXPOSE 5672
EXPOSE 61613
EXPOSE 1883
EXPOSE 61614
EXPOSE 1099

# Expose some folders
VOLUME ["/data/activemq"]
VOLUME ["/var/log/activemq"]
VOLUME ["/opt/activemq/conf"]

WORKDIR /opt/activemq

CMD ["/app/run.sh"]
