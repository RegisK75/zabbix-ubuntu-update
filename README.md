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
| Name                      | Description                                  | Type            | 
| :------------------------ | :------------------------------------------- | :---------------|
| OS-Get-JSON               | Get json file from shell script              | Zabbix Agent    |
| reboot required           | 1 = reboot required ; 0 = no reboot required | Dependent item  |
| Security update available | Number of security updates available         | Dependent item  |
| Update available          | Number of updates available                  | Dependent item  |

## Triggers
| Name                                          | Description                          | Severity        |
| :-------------------------------------------- | :----------------------------------- | :---------------|
| reboot required                               | Reboot is required                   | WARNING         |
| {ITEM.LASTVALUE} security update(s) available | Security updates available           | AVERAGE         |
| {ITEM.LASTVALUE} update(s) available          | Updates available                    | WARNING         |
