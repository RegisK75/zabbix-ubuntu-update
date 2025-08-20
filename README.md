# Zabbix template for ubuntu OS updates

## Overview
This is not official zabbix template.

## Requirements
Zabbix server/agent 7.x.
Ubuntu 22.04 and 24.04.

## Setup

1. Copy shell script 'check-os-update.sh' on zabbix agent(s) filesystem.
2. It should be executed with root privileges.
3. Use crontab to schedule regular execution of this script.
4. Copy zabbix template to your zabbix server.
5. Apply template to zabbix agent(s) where shell script is copied.

## Items
| Name | Description | Type | Key and additional info |
| --------------- | -------------------------------- | ---------------- | -------------------------------- |
|  OS-Get-JSON    | Get json file from shell script  | Zabbix Agent     | No option                        |
