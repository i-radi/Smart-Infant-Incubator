# be/BackEnd

## Migrations
* Open Package Manager Console
* Add-Migration <Name> | dotnet ef migrations add <name>
* Update-DataBase | dotnet ef database update

## Build Project
* Download .NET SDK (6)
* Download SqlServer 

** Open terminal of the project path
* dotnet tool install --global dotnet-ef
* dotnet ef database update     ==> path:BackEnd\DataAccess> 
* dotnet run                    ==> path:BackEnd\IncubatorApi>

* Use API e.g. Postman

# Add RabbitMQ
1-Open Docker Desktop
2-Open CLI ==>  docker run -d --hostname my-rabbit --name rabbit -p 15672:15672 -p 5672:5672 rabbitmq:3-management

# Add InfluxDB
1-Open Docker Desktop 
2-Run a new run-instance of InfluxDB using this command:
*docker run --name influxdb -p 8086:8086 influxdb:latest
3-Create new bucket in influxdb client 
4-Copy your API token form influxdb client and paste it in appsettings.json file

Now you can query in influxdb client

## To use Seq
* docker pull datalust/seq
* docker run --name seq -d --restart unless-stopped -e ACCEPT_EULA=Y -p 5341:80 datalust/seq:latest
* http://localhost:5341/

## Docker commandlines
* docker build -t ibrahimradi/incubatorapi .
* docker run -p 8080:80 ibrahimradi/incubatorapi
* docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Pa$$w0rd2022' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:latest-ubuntu
* docker run
* docker-compose up --build

http://localhost:8000/swagger/index.html
http://localhost:5341/#/events
## Getting Started

Download links:

SSH clone URL: ssh://git@git.jetbrains.space/bhi/be/BackEnd.git

HTTPS clone URL: https://git.jetbrains.space/bhi/be/BackEnd.git



These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisites

What things you need to install the software and how to install them.

```
Examples
```

## Deployment

Add additional notes about how to deploy this on a production system.

## Resources

Add links to external resources for this project, such as CI server, bug tracker, etc.
