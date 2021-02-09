# SeoulAir
Project SeoulAir is a group of projects comprised of six smaller microservice projects: Device, Data, Analytics, Command, Gateway and Web Dashboard. 
Main purpose is to provide microservices which will accept sensor data, store it in database, search, filter and analyze that data. Notify end users of important events/alerts. Store those notifications and alerts and accept user changes and commands.

# Built with 

## Pre requirements


## Technologies and versions used:
- .NET Core (3.1)
- ASP .NET Core (3.1)
- MQTT Message broker
- Docker Engine (20.10.2)
- MongoDB (4.4.3)
- Microsoft SQL server (2019)
- Angular (11.0.5)

# Links to microservices
Device Microservice
[SeoulAir / seoulair-device · GitLab](https://gitlab.com/seoulair/seoulair-device)

Data Microservice 
[SeoulAir / seoulair-data · GitLab](https://gitlab.com/seoulair/seoulair-data)

Analytics Microservice 
[SeoulAir / seoulair-analytics · GitLab](https://gitlab.com/seoulair/seoulair-analytics)

Command Microservice 
[SeoulAir / seoulair-command · GitLab](https://gitlab.com/seoulair/seoulair-command)

Gateway Microservice
[SeoulAir / seoulair-gateway · GitLab](https://gitlab.com/seoulair/seoulair-gateway)

Dashboard Microservice
[SeoulAir / seoulair-dashboard · GitLab](https://gitlab.com/seoulair/seoulair-dashboard)


# Starting projects
 
 ## Windows
 When cloned all projects must be cloned in the same folder. 
 To start each individual project use cli command:   
 >docker-compose up --build
 
 Projects must be launched one by one, in the specific order: 
1. Device Microservice, 
2. Command Microservice, 
3. Analytics Microservice, 
4. Data Microservice, 
5. Gateway Microservice, 
6. Dashboard Microservice.

To test each projects individual endpoints, after starting them, use: 
>localhost://port/index.html
	
Ports for microservices are:
- Device: 5500
- Data: 5600
- Analytics: 5700
- Command: 5800
- Gateway: 5900
- Dashboard: 6000

## Linux scripts
For starting the project on Linux operating systems use **[provided scripts](https://gitlab.com/seoulair/seoulair-documentation/-/tree/master/shell-scripts)**.

*Note:* **After being cloned, all projects must be in the same root folder.**

- To start all projects automatically use cli command: 
>```sh seoulair-start.sh root```

**root** - being the absolute or relative path to the main folder in which all the projects are situated.

- __If there are problems staring the project__ , use following command to first clean docker images and containers, and start from zero state.
>```sh seoulair-clean.sh```


# Documentation
Detailed documentation for each endpoint of each project can be found at **[documentation](https://gitlab.com/seoulair/seoulair-documentation/-/tree/master/open-api)** , or at links in README files of each project.

## Project endpoints documentation: 
- [Device documentation](https://glcdn.githack.com/seoulair/seoulair-documentation/-/raw/master/open-api/SeoulAir%20Device/seoulair-device-open-api.html)
- [Data documentation](https://gl.githack.com/seoulair/seoulair-documentation/-/raw/master/open-api/SeoulAir%20Data/seoulair-data-open-api.json.html)
- [Analytics documentation](https://glcdn.githack.com/seoulair/seoulair-documentation/-/raw/master/open-api/SeoulAir%20Analytics/seoulair-analytics-open-api.html)
- [Command documentation](https://glcdn.githack.com/seoulair/seoulair-documentation/-/raw/master/open-api/SeoulAir%20Command/seoulair-command-open-api.html)

