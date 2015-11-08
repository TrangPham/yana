#!/bin/bash

source "common.sh"

curl -XPOST ${SERVER?}/${NAME?}/entry/_mapping -d '{
   "entry": {
      "properties": {
         "entry_id": {
            "type": "string",
            "index": "not_analyzed"
         },
         "user_id": {
            "type": "string",
            "index": "not_analyzed"
         },
         "title": {
            "type": "string",
            "term_vector": "yes",
            "store": "yes"
         },
         "text": {
            "type": "string",
            "term_vector": "yes",
            "store": "yes"
         },
         "tags": {
            "type": "multi_field",
            "fields": {
               "tags": {
                  "type": "string",
                  "term_vector": "yes"
               },
               "raw": {
                  "type": "string",
                  "index": "not_analyzed"
               }
            }
         },
         "created_at": {
            "type": "date",
            "index": "not_analyzed"
         },
         "updated_at": {
            "type": "date",
            "index": "not_analyzed"
         }
      }
   }
}
'
