#!/bin/bash
/opt/mssql/bin/sqlservr &

echo "⏳ Waiting for SQL Server to start..."
sleep 30

echo "⚙️ Installing sqlcmd..."
apt-get update && apt-get install -y curl gnupg apt-transport-https unixodbc-dev
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list
apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc

export PATH="$PATH:/opt/mssql-tools/bin"

echo "🚀 Running init-db.sql..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'StrongPass123!' -i /init-db.sql

wait
