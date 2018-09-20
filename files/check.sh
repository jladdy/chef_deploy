#!/bin/bash

if [[ $(while read IP; do curl -Is http://"$IP" | head -n 1; done < /tmp/nodes) = *"HTTP/1.1 200 OK"* ]]; then
  echo "Restarting nginx"
  service nginx restart
fi
