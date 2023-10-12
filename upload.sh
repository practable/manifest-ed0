#!/bin/bash

export BOOK_CLIENT_SECRET=$(cat ~/secret/app.practable.io/ed0/book.pat)
export BOOK_CLIENT_TOKEN_TTL=5m
export BOOK_CLIENT_TOKEN_ADMIN=true
export BOOK_CLIENT_TOKEN_AUD=https://app.practable.io/ed0/book
export BOOK_CLIENT_TOKEN_SUB=admin

export BOOK_CLIENT_TOKEN=$(../admin-tools/ed0/bin/book token)
export BOOK_CLIENT_SCHEME=https
export BOOK_CLIENT_HOST=app.practable.io
export BOOK_CLIENT_BASE_PATH=/ed0/book/api/v1
export BOOK_CLIENT_FORMAT=YAML

c=$(./check.sh | wc -l)
if ! [ $c -eq 0 ]; then
        echo "Manifest check returned errors, did not upload"
		./check.sh
		exit 1
fi

../admin-tools/ed0/bin/book manifest replace manifest.yaml
