# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy solution file and project csproj files
COPY *.sln ./
COPY ServicePro.API/*.csproj ./ServicePro.API/
COPY ServicePro.Core/*.csproj ./ServicePro.Core/
COPY ServicePro.Infrastructure/*.csproj ./ServicePro.Infrastructure/
COPY ServicePro.Services/*.csproj ./ServicePro.Services/

# Restore dependencies
RUN dotnet restore

# Copy everything else
COPY . .

# Publish API project
RUN dotnet publish ServicePro.API/ServicePro.API.csproj -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

# Listen on Render dynamic port
ENV ASPNETCORE_URLS=http://+:10000
EXPOSE 10000

ENTRYPOINT ["dotnet", "ServicePro.API.dll"]
