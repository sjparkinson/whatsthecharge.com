# What's the charge?

Electric vehicle public charging network comparison.

```
bundle install
bundle exec rails db:create db:migrate db:seed
bundle exec rails s
```

## Secrets

Create a `.env` that has the following filled in...

```
DATABASE_URL=...
SECRET_KEY_BASE=...
```

Then publish the secret to Kubernetes.

```
kubectl create secret generic whatsthecharge.com --from-env-file=.env
```
