# 🔌 What's the charge?

Electric vehicle public charging network comparison.

https://whatsthecharge.com

## Requirments

* Ruby 2.7+
* Postgres 12+

## Configuration values

The following environment variables are required in production.

* **`DATABASE_URL`**: The Postgresql connection URL, e.g. `postgresql://postgres:hunter2@localhost:5432/production`.

* **`SECRET_KEY_BASE`**: This value can be generated using `bundle exec rails secret`.

In other environments the default configuration values for the database are set in `config/database.yaml`.

## Running locally

Install the dependencies.

```
bundle install
yarn install
```

Setup the database. This will load the schema (from `db/schema.rb`) and seed the database (from `db/seed.rb`).

```
bundle exec rails db:setup
```

Then start the development server.

```
bundle exec rails server
```

You should then be able to visit http://localhost:3000.

To test out the management pages, you'll need to create a user you can login with.

```
bundle exec rails runner "User.create(email: 'user@example.com', password: 'hunter2')"
```

## Running on Kubernetes

There is a Kubernetes deployment defined in `k8s/`.

You will need a Kubernetes cluster configured with [the ingress-nginx ingress controller](https://github.com/kubernetes/ingress-nginx).

You will also need to create a secret named `whatsthecharge.com`, which should include the two configuration values defined above.

```
kubectl create secret generic whatsthecharge.com \
  --from-literal=DATABASE_URL="postgresql://postgres:hunter2@localhost:5432/production" \
  --from-literal=SECRET_KEY_BASE="$(bundle exec rails secret)"
```

Then create a new deployment.

```
kubectl apply -f k8s/
```
