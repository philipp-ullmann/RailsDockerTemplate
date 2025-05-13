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
docker-compose run --name rails-new web rails new . --force --database=mysql --skip-bundle --skip-docker --skip-test --skip-jbuilder
```

5. Build the docker image

```
docker-compose build
```

6. Update database details on config/database.yml file

```
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: 5
  username: root
  host: mysql

development:
  <<: *default
  database: development

test:
  <<: *default
  database: test
```

7. Run

```
docker-compose up -d
```

8. Browse http://localhost:3000

## Visual Studio

### Extensions

* Ruby LSP
* ruby-rubocop
* endwise
* Ruby on Rails

Configuration file: *.vscode\settings.json*:

```
{
    "workbench.colorTheme": "Solarized Light+",
    "git.enableSmartCommit": true,
    "git.confirmSync": false,
    "github.gitProtocol": "ssh",
    "ruby.rubocop.executePath": "docker-compose exec -T web ./bin/rubocop",
    "ruby.rubocop.configFilePath": "C:/Path/.rubocop.yml",
    "ruby.rubocop.onSave": true,
    "[ruby]": {
        "editor.defaultFormatter": "misogi.ruby-rubocop"
    }
}
```