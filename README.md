# SeoulAir
Project SeoulAir is a group of projects comprised of six smaller microservice projects: Device, Data, Analytics, Command, Gateway and Web Dashboard. 
Main purpose is to provide microservices which will accept sensor data, store it in database, search, filter and analyze that data. Notify end users of important events/alerts. Store those notifications and alerts and accept user changes and commands.

## Device Microservice
Takes measurements of air particles from Sensor, by reading data from [data.csv](https://gitlab.com/seoulair/seoulair-device/-/tree/develop/resources) file. Data is then sent to Data Microservice by Publishing it on MQTT broker to which Data is subscribed to.  Device microservice also offers REST methods to GET current sensor and actuator parameters, and PUT methods to set and modify them.

## Data Microservice
This microservice takes data from Device microservice trough MQTT broker, stores them in Mongo database, and eventually retrieves them and send them to Analytics microservice.

## Analytics Microservice
Gets data from Data Microservice, analyzes them, stores them in Mongo database, and sends notifications and alerts to Dashboard microservice, relevant to the normal values of measurements of air pollution, while also sending REST request to Command Microservice which will send an appropriate action to Device Microservice to apply to Actuator.

## Command Microservice
Sends commands to the virtual actuator via Device Microservice.

## Gateway Microservice
This microservice is used to access other microservices in SeoulAir group. 

## Dashboard Microservice
Takes data, notifications and alerts trough Gateway microservice and visualizes them using among other Angular materials, as well as enabling options to set sensor, actuator and command parameters.


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
- Dashboard: 8080

## Linux scripts
For starting the project on Linux operating systems use **[provided scripts](https://gitlab.com/seoulair/seoulair-documentation/-/tree/master/shell-scripts)**.

*Note:* **After being cloned, all projects must be in the same root folder.**

- To start all projects automatically use cli command: 
>```sh seoulair-start.sh root```

**root** - being the absolute or relative path to the main folder in which all the projects are situated.

- __If there are problems staring the project__ , use following command to first clean docker images and containers, and start from zero state.
>```sh seoulair-clean.sh```


# Documentation
Detailed documentation for each endpoint of each project can be found at **[documentation](https://gitlab.com/seoulair/seoulair-documentation/-/tree/master/open-api)** .

## Project endpoints documentation: 
- [Device documentation](https://glcdn.githack.com/seoulair/seoulair-documentation/-/raw/master/open-api/SeoulAir%20Device/seoulair-device-open-api.html)
- [Data documentation](https://gl.githack.com/seoulair/seoulair-documentation/-/raw/master/open-api/SeoulAir%20Data/seoulair-data-open-api.json.html)
- [Analytics documentation](https://glcdn.githack.com/seoulair/seoulair-documentation/-/raw/master/open-api/SeoulAir%20Analytics/seoulair-analytics-open-api.html)
- [Command documentation](https://glcdn.githack.com/seoulair/seoulair-documentation/-/raw/master/open-api/SeoulAir%20Command/seoulair-command-open-api.html)

