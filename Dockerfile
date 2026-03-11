# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy solution file first
COPY *.sln ./

# Copy each project folder with its .csproj file
COPY ServicePro.API/ ServicePro.API/
COPY ServicePro.Core/ ServicePro.Core/
COPY ServicePro.Infrastructure/ ServicePro.Infrastructure/
COPY ServicePro.Services/ ServicePro.Services/

# Restore dependencies
RUN dotnet restore

# Copy all source code
COPY . .

# Publish API project
RUN dotnet publish ServicePro.API/ServicePro.API.csproj -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy published files from build stage
COPY --from=build /app/publish ./

# Listen on dynamic port
ENV ASPNETCORE_URLS=http://+:10000
EXPOSE 10000

ENTRYPOINT ["dotnet", "ServicePro.API.dll"]
