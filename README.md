## Ruby version
  * 2.5.8

## Configuration
  * bundle install
  
## Database creation
  * postgresql
  * rake db:create
  * rake db:migrate
  * rake db:seed

## How to run the test suite
Tests all
```
(...)$: rspec
.......................
Finished in 0.33206 seconds (files took 2.46 seconds to load)
23 examples, 0 failures
```
Test Models
```
rspec spec/models
...........
Finished in 0.12062 seconds (files took 2.32 seconds to load)
11 examples, 0 failures
```
Test API
```
rspec spec/requests
............
Finished in 0.29916 seconds (files took 2.14 seconds to load)
12 examples, 0 failures
```
* Production on Heroku - Swagger
  * [Link to Production](http://customer-kkpg.herokuapp.com/api-docs/index.html)
  
## Docker
  * [HOW-TO Install Video](https://www.youtube.com/watch?v=vn27fUbOLbg)
  * [Docs-Docker - Compose Rails](https://docs.docker.com/compose/rails/)
  * To run with docker needs to modify database.yml file to
```
default: &default
  adapter: postgresql
  pool: 5
  timeout: 5000
  username: postgres
  password: 
  host: <%= ENV['DEVELOPMENT_DATABASE_HOST'] %>
```
  * All set run to build
```shell
$: docker-compose build

$: docker-compose run web rake db:create

$: docker-compose run web rake db:migrate

$: docker-compose run web rake db:seed
```
  * To run the application
```
docker-compose up
```

  * You can see logs from docker-compose
```
Guilhermes-MacBook-Pro:customer_kkpg guilhermebarbosa$ docker-compose up
Starting customer_kkpg_db_1 ... done
Starting customer_kkpg_web_1 ... done
Attaching to customer_kkpg_db_1, customer_kkpg_web_1
db_1   | 
db_1   | PostgreSQL Database directory appears to contain a database; Skipping initialization
db_1   | 
db_1   | 2020-05-19 02:02:45.490 UTC [1] LOG:  starting PostgreSQL 12.3 (Debian 12.3-1.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
db_1   | 2020-05-19 02:02:45.491 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1   | 2020-05-19 02:02:45.491 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1   | 2020-05-19 02:02:45.493 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2020-05-19 02:02:45.508 UTC [25] LOG:  database system was shut down at 2020-05-19 02:02:43 UTC
db_1   | 2020-05-19 02:02:45.513 UTC [1] LOG:  database system is ready to accept connections
web_1  | => Booting Puma
web_1  | => Rails 6.0.3 application starting in development 
web_1  | => Run `rails server --help` for more startup options
web_1  | Puma starting in single mode...
web_1  | * Version 4.3.3 (ruby 2.5.8-p224), codename: Mysterious Traveller
web_1  | * Min threads: 5, max threads: 5
web_1  | * Environment: development
web_1  | * Listening on tcp://0.0.0.0:3000
web_1  | Use Ctrl-C to stop
web_1  | Started GET "/api-docs/index.html" for 172.19.0.1 at 2020-05-19 02:02:50 +0000
web_1  |    (1.0ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
web_1  | Started GET "/api-docs/swagger-ui.css" for 172.19.0.1 at 2020-05-19 02:02:50 +0000
web_1  | Started GET "/api-docs/swagger-ui-standalone-preset.js" for 172.19.0.1 at 2020-05-19 02:02:50 +0000
(...)
```