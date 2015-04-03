#!/bin/bash

# auto-remove records older than 2592000 seconds (30 days)
mongo xhprof --eval 'db.collection.ensureIndex( { "meta.request_ts" : 1 }, { expireAfterSeconds : 2592000 } )'

# indexes
mongo xhprof --eval  "db.collection.ensureIndex( { 'meta.SERVER.REQUEST_TIME' : -1 } )"
mongo xhprof --eval  "db.collection.ensureIndex( { 'profile.main().wt' : -1 } )"
mongo xhprof --eval  "db.collection.ensureIndex( { 'profile.main().mu' : -1 } )"
mongo xhprof --eval  "db.collection.ensureIndex( { 'profile.main().cpu' : -1 } )"
mongo xhprof --eval  "db.collection.ensureIndex( { 'meta.url' : 1 } )"

touch /root/indexed_xhgui.txt
