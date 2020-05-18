## Ruby version
  * 2.5.7

## Configuration
  * bundle install
  
## Database creation
  * postgresql
  * rake db:create

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
  