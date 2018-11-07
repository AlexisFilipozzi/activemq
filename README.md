# Table of Contents
- [Introduction](#introduction)
    - [Version](#version)
    - [Changelog](Changelog.md)
- [Hardware Requirements](#hardware-requirements)
    - [CPU](#cpu)
    - [Memory](#memory)
    - [Storage](#storage)
- [Contributing](#contributing)
- [Issues](#issues)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [ACCESS](#access)
  - [QUEUE](#queue)
  - [TOPIC](#topic)
  - [Data Store](#data-store)
  - [BROKER](#broker)
  - [Disk usage](#disk-usage)
  - [JMX](#JMX)
  - [Avaible Configuration Parameters](#avaible-configuration-parameters)
  - [Advance configuration](#advance-configuration)
- [References](#references)

# Introduction

Dockerfile to build a ActiveMQ container image.

# Configuration

## Avaible Configuration Parameters

*Please refer the docker run command options for the `--env-file` flag where you can specify all required environment variables in a single file. This will save you from writing a potentially long docker run command. Alternately you can use fig.*

Below is the complete list of available options that can be used to customize your activemq installation.

- **ACTIVEMQ_NAME**: The hostname of ActiveMQ server. Default to `localhost`
- **ACTIVEMQ_LOGLEVEL**: The log level. Default to `INFO`
- **ACTIVEMQ_PENDING_MESSAGE_LIMIT**: It is used to prevent slow topic consumers to block producers and affect other consumers by limiting the number of messages that are retained. Default to `1000`
- **ACTIVEMQ_STORAGE_USAGE**: The maximum amount of space storage the broker will use before disabling caching and/or slowing down producers. Default to `100 gb`
- **ACTIVEMQ_TEMP_USAGE**: The maximum amount of space temp the broker will use before disabling caching and/or slowing down producers. Default to `50 gb`
- **ACTIVEMQ_MAX_CONNECTION**: It's DOS protection. It limit concurrent connections. Default to `1000`
- **ACTIVEMQ_FRAME_SIZE**: It's DOS protection. It limit the frame size. Default to `104857600` (100MB)
- **ACTIVEMQ_ENABLED_SCHEDULER**: Permit to enabled scheduler in ActiveMQ. Default to `true`
- **ACTIVEMQ_ENABLED_AUTH**: Permit to enabled the authentification in queue and topic (no anonymous access). Default to `false`
- **ACTIVEMQ_MIN_MEMORY**: The init memory in MB that ActiveMQ take when start (it's like XMS). Default to `128` (128 MB)
- **ACTIVEMQ_MAX_MEMORY**: The max memory in MB that ActiveMQ can take (it's like XMX). Default to `1024` (1024 MB)

- **ACTIVEMQ_REMOVE_DEFAULT_ACCOUNT**: It's permit to remove all default login on ActiveMQ (Webconsole, broker and JMX). Default to `false`
- **ACTIVEMQ_ADMIN_LOGIN**: The login for admin account (broker and web console). Default to `admin`
- **ACTIVEMQ_ADMIN_PASSWORD**: The password for admin account. Default to `admin`
- **ACTIVEMQ_USER_LOGIN**: The login to access on web console with user role (no right on broker). Default to `user`
- **ACTIVEMQ_USER_PASSWORD**: The password for user account. Default to `user`
- **ACTIVEMQ_READ_LOGIN**: The login to access with read only role on all queues and topics.
- **ACTIVEMQ_READ_PASSWORD**: The password for read account.
- **ACTIVEMQ_WRITE_LOGIN**: The login to access with write role on all queues and topics.
- **ACTIVEMQ_WRITE_PASSWORD**: The password for write account.
- **ACTIVEMQ_OWNER_LOGIN**: The login to access with admin role on all queues and topics.
- **ACTIVEMQ_OWNER_PASSWORD**: The password for owner account.
- **ACTIVEMQ_JMX_LOGIN**: The login to access with read / write role on JMX. Default to `admin`
- **ACTIVEMQ_JMX_PASSWORD**: The password for JMX account. Default to `activemq`

- **ACTIVEMQ_STATIC_TOPICS**: The list of topics separated by comma witch is created when ActiveMQ start.
- **ACTIVEMQ_STATIC_QUEUES**: The list of queues separated by comma witch is created when ActiveMQ start.

## Advance configuration

For advance configuration, the best way is to read ActiveMQ documentation and created your own setting file like activemq.xml.
Next, you can mount it when you run this image or you can create your own image (base on this image) and include your specifics config file.

The home of ActiveMQ is in /opt/activemq, so if you want to override all the setting, you can launch docker with ` -v /your_path/conf:/opt/activemq/conf`
