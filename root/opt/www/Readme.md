# Alpine Linux Hacker Station
## Introduction
This service can be used for solving Hacking-Lab challenges. Some challenges require the attacker to provide a landing page or a website, for example an XSRF website. With this service, such attacker pages can be created and used in the context of hacking challenges. The service will run for 1 hour. 

## Features
1. web [IDE](/theia/#/home/theia/workspace.theia-workspace) to create content in this docker service (`html, css, php, javascript, ...``)
2. nginx + php web service 
3. shell access (through Theia Web IDE)


![Theia](./img/theia.png)


## Shell Access
The `awesome` Theia web ide comes with a built-in shell. 
![Theia](./img/shell.png)

## Attacker Web Site
* Please edit your content in `/opt/www` with [Theia](/theia/#/home/theia/workspace.theia-workspace) 
* Please test [PHP Info](/info.php) in the folder `/opt/www/php.info` by clicking on the [PHP Info](/info.php)

