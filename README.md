## Ruby on Rails docker development template with mysql

1. First clone the project
```
git clone https://philippullmann@dev.azure.com/philippullmann/RailsDockerTemplate/_git/RailsDockerTemplate your_project_name
```

2. Change directory
```
cd your_project_name
```

3. Update rails version on the Gemfile
```
source 'https://rubygems.org'
gem 'rails', '8.0.1'
```

4. Update Ruby version on Dockerfile
```
FROM  ruby:3.3.6-slim
```

5. Remove git folder
```
rm .git
```

6. Now install new rails app
```
docker-compose run app rails new . --name rails-new --force --database=mysql --skip-bundle --skip-docker
```

7. Build the docker image
```
docker-compose build
```

8. Update database details on config/database.yml file
```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: root
  password: "root"
  host: mysql

development:
  <<: *default
  database: dev

test:
  <<: *default
  database: dev
```

9. Run
```
docker-compose up
```

10. Browse http://localhost:3000