#!/bin/bash
yamllint manifest.yaml
# relies on admin-tools repo being in parent dir
../admin-tools/ed0/bin/book manifest check manifest.yaml
c=$(cat manifest.yaml | grep '}}}' | wc -l)
if ! [ $c -eq 0 ]; then
    echo "too many curly braces - app may not work!"
	cat manifest.yaml | grep '}}}'
fi
c=$(cat manifest.yaml | grep '{{{' | wc -l)
if ! [ $c -eq 0 ]; then
    echo "too many curly braces - app may not work!"
	cat manifest.yaml | grep '{{{'
fi
