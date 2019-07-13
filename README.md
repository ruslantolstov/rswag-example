# README

Demo how to use rswag-api, rswag-specs.
 

### Setup

```
cp .env.example .env
rails db:create db:migrate
rails server
```

### Setup Docker
```
docker-compose build
docker-compose up
docker-compose run web rake db:create db:migrate
open http://localhost:3000/
```
Use `docker attach ID` to get into the running container, for detach without exit `Ctrl-p`, `Ctrl-q`

### Generate the Swagger JSON file

```
rake rswag:specs:swaggerize
open http://localhost:3000/api/docs/swagger.json
```


