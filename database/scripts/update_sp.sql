- name: Install SQLCMD
  run: sudo apt-get install -y mssql-tools unixodbc-dev

- name: Run DB Scripts
  run: |
    /opt/mssql-tools/bin/sqlcmd -S $DB_SERVER -U $DB_USER -P $DB_PASS -d $DB_NAME -i database/scripts/update_sp.sql
  env:
    DB_SERVER: ${{ secrets.DB_SERVER }}
    DB_USER: ${{ secrets.DB_USER }}
    DB_PASS: ${{ secrets.DB_PASS }}
    DB_NAME: ${{ secrets.DB_NAME }}
