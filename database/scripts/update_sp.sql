# 8. Install SQLCMD
- name: Install SQLCMD
  run: |
    sudo apt-get update
    sudo apt-get install -y curl apt-transport-https
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
    sudo apt-get update
    sudo ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev

# 9. Run DB Script
- name: Run DB Script
  run: |
    /opt/mssql-tools/bin/sqlcmd -S $DB_SERVER -U $DB_USER -P $DB_PASS -d $DB_NAME -i ServicePro.API/database/scripts/update_sp.sql
  env:
    DB_SERVER: ${{ secrets.DB_SERVER }}
    DB_USER: ${{ secrets.DB_USER }}
    DB_PASS: ${{ secrets.DB_PASS }}
    DB_NAME: ${{ secrets.DB_NAME }}
