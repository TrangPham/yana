#!/bin/bash

source "common.sh"

curl -XPOST ${SERVER?}/${NAME?}/participant/_mapping -d '{
   "participant": {
      "properties": {
         "id": {
            "type": "string",
            "store": "yes"
         },
         "first_name": {
            "type": "string",
            "store": "yes"
         },
         "last_name": {
            "type": "string",
            "store": "yes"
         },
         "birth_date": {
            "type": "date"
         },
         "category": {
            "type": "string"
         },
         "bio": {
            "type": "multi_field",
            "fields": {
               "bio": {
                  "type": "string",
                  "store": "yes",
                  "term_vector": "yes"
               },
               "raw": {
                  "type": "string",
                  "store": "yes",
                  "index": "not_analyzed"
               }
            }
         }
      }
   }
}
'
