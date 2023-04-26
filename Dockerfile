# Probably fix at 3.10 but allow patch versions to update 
FROM --platform=linux/amd64 python:3.10-slim

WORKDIR /app

# install system dependencies
RUN apt-get update && apt-get install -y curl gnupg2 apt-transport-https ca-certificates gcc g++ \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17 unixodbc-dev

# install python
RUN pip install poetry==1.2.1

ENV PYTHONPATH=/app

USER app

