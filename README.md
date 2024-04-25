# README

```bash
k get pods -l "app.kubernetes.io/part-of=worker,mshr.dec/use-sidecar=true" -o json | \
jq '.items[] |
    select(.status.containerStatuses[].name == "ruby") |
    select(.status.containerStatuses[].ready == false) |
    .metadata.labels | .["batch.kubernetes.io/job-name"]'
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
