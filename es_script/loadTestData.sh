#!/bin/bash

source "common.sh"

echo "Create test participants"
curl -XPOST ${SERVER?}/${NAME?}/participant -d '{
   "user_id": "U01",
   "first_name": "Michael",
   "last_name": "Xie",
   "bio": "Michael is in bioinformatics and used to work in the same organization as Daniel"
}
'

curl -XPOST ${SERVER?}/${NAME?}/participant -d '{
   "user_id": "U02",
   "first_name": "Tom",
   "last_name": "Choi",
   "bio": "Tom uses a Macbook"
}
'

curl -XPOST ${SERVER?}/${NAME?}/participant -d '{
   "user_id": "U03",
   "first_name": "Tim",
   "last_name": "Cheung",
   "bio": "Tim uses a Toshiba laptop"
}
'
