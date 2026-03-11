# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy csproj and restore first (faster rebuilds)
COPY *.csproj ./
RUN dotnet restore

# Copy all files and publish
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

# Listen on Render port
ENV ASPNETCORE_URLS=http://+:10000
EXPOSE 10000

# Run the app
ENTRYPOINT ["dotnet", "ServicePro.API.dll"]
