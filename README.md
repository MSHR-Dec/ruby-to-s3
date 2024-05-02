# README

```bash
kubectl get pods \
--selector "app.kubernetes.io/part-of=worker,mshr.dec/use-sidecar=true" \
--field-selector status.phase==Running \
-o=jsonpath="{range .items[?(@.status.containerStatuses[0].state.terminated.finishedAt <= '"$(date -v -60S '+%Y-%m-%dT%H:%M:%SZ')"')]}\
{.metadata.labels.batch\.kubernetes\.io/job-name}{'\t'}\
{.status.containerStatuses[0].ready}{'\t'}\
{.status.containerStatuses[1].ready}{'\n'}\
{end}" \
| awk '{if($2 == "false" && $3 == "true") print $1}'
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
