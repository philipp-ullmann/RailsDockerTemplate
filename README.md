# Ruby on Rails docker development template with mysql

## Getting started

1. First clone the project

```
git clone git@github.com:philipp-ullmann/RailsDockerTemplate.git your_project_name
```

2. Change directory

```
cd your_project_name
```

3. Remove git folder

```
rm -rf .git
```

4. Now install new rails app

```
docker-compose run --name rails-new web rails new . --force --database=postgresql --skip-bundle --skip-docker --skip-test --skip-jbuilder
```

5. Build the docker image

```
docker-compose build
```

6. Update database details on config/database.yml file

```
default: &default
  adapter: postgresql
  encoding: unicode
  username: <%= ENV.fetch("DB_USERNAME") { "postgres" } %>
  password: <%= ENV.fetch("DB_PASSWORD") { "secret" } %>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: <%= ENV.fetch("DB_HOST") { "db" } %>

development:
  <<: *default
  database: development

test:
  <<: *default
  database: test

production:
  primary: &primary_production
    <<: *default
    database: production
    username: workspace
    password: <%= ENV["WORKSPACE_DATABASE_PASSWORD"] %>
  cache:
    <<: *primary_production
    database: production_cache
    migrations_paths: db/cache_migrate
  queue:
    <<: *primary_production
    database: production_queue
    migrations_paths: db/queue_migrate
  cable:
    <<: *primary_production
    database: production_cable
    migrations_paths: db/cable_migrate
```

7. Run

```
docker-compose up -d
```

8. Browse http://localhost:3000

## Development

* Connect to web instance

```
docker-compose exec web bash
```

* Connect to postgresql database

```
docker-compose exec db psql -U postgres development
```

## Visual Studio

### Extensions

* Ruby LSP
* VSCode rdbg Ruby Debugger
* ruby-rubocop
* endwise

## Windows setup

1. Install ruby version [3.4.4](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.4.4-2/rubyinstaller-devkit-3.4.4-2-x64.exe)
1. *gem install rubocop*
1. *gem install debug*
1. *gem install fiddle*