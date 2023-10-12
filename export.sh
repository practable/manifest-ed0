#!/bin/bash

export BOOK_CLIENT_SECRET=$(cat ~/secret/v0/book.pat)
export BOOK_CLIENT_TOKEN_TTL=5m
export BOOK_CLIENT_TOKEN_ADMIN=true
export BOOK_CLIENT_TOKEN_AUD=https://dev.practable.io/book
export BOOK_CLIENT_TOKEN_SUB=admin

export BOOK_CLIENT_TOKEN=$(book token)
export BOOK_CLIENT_SCHEME=https
export BOOK_CLIENT_HOST=dev.practable.io
export BOOK_CLIENT_BASE_PATH=/book/api/v1
export BOOK_CLIENT_FORMAT=YAML

book manifest export

