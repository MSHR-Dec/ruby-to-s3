#!/bin/bash

set -eu

function create_bucket() {
  awslocal s3 mb s3://ruby-to-s3
}

create_bucket
