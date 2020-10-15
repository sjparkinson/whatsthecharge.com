# What's the charge?

Electric vehicle public charging network comparison.

## Getting started developing

Create a new GitHub Codespace for this repository to get developing. The details are all configured in `.devcontainer/`.

Start the development server with the following.

```
bundle exec rails s
```

## Dependencies

* Postgres

## Secrets

The following environment variables are required in production.

* `DATABASE_URL`
* `SECRET_KEY_BASE` (can be generated using `bundle exec rails secret`)

These can be published to Kubernetes from a `.env` file using the following command.

```
kubectl create secret generic whatsthecharge.com --from-env-file=.env
```
