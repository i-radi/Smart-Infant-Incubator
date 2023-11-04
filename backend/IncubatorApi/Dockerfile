# first-stage base image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# copy csproj and restore dependencies
COPY *.csproj ./
RUN dotnet restore 

# copy and publish application
COPY . ./
RUN dotnet publish -c Release -o out

# final-stage image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 
WORKDIR /app
EXPOSE 80
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "IncubatorApi.dll"]
