# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the solution file first
COPY *.sln ./

# Copy all project files into their respective folders
COPY ServicePro.API/*.csproj ServicePro.API/
COPY ServicePro.Core/*.csproj ServicePro.Core/
COPY ServicePro.Infrastructure/*.csproj ServicePro.Infrastructure/
COPY ServicePro.Services/*.csproj ServicePro.Services/

# Restore dependencies for the solution
RUN dotnet restore

# Copy all source code
COPY . .

# Publish the API project
RUN dotnet publish ServicePro.API/ServicePro.API.csproj -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy published files from build stage
COPY --from=build /app/publish ./

# Use Render dynamic port
ENV ASPNETCORE_URLS=http://+:10000
EXPOSE 10000

ENTRYPOINT ["dotnet", "ServicePro.API.dll"]
