# README

Demo how to use rswag-api, rswag-specs.
 

### Setup

```
cp .env.example .env
rails db:create db:migrate
rails server
```

### Generate the Swagger JSON file

```
rake rswag:specs:swaggerize
open http://localhost:3000/api/docs/swagger.json
```


