FROM elixir:1.6.3

# postgresql-client is required to run `pg_isready` in bin/entrypoint.sh
# `pg_isready` is used to check whether the postgres server is running
RUN apt-get update && apt-get install -y postgresql-client

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force

# Compile the project
RUN mix do compile

CMD ["/app/bin/entrypoint.sh"]
