# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the solution file first
COPY ServicePro.API.sln ./
# Copy all project folders with their .csproj files
COPY ServicePro.API/ ServicePro.API/
COPY ServicePro.Core/ ServicePro.Core/
COPY ServicePro.Infrastructure/ ServicePro.Infrastructure/
COPY ServicePro.Services/ ServicePro.Services/

# Restore dependencies for the solution
RUN dotnet restore ServicePro.sln

# Copy all source code
COPY . .

# Build and publish the API project
RUN dotnet publish ServicePro.API/ServicePro.API.csproj -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy the published files from build stage
COPY --from=build /app/publish ./

# Listen on Render dynamic port
ENV ASPNETCORE_URLS=http://+:10000
EXPOSE 10000

# Run the API
ENTRYPOINT ["dotnet", "ServicePro.API.dll"]
