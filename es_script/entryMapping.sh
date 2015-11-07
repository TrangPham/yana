#!/bin/bash

source "common.sh"

curl -XPOST ${SERVER?}/${NAME?}/entry/_mapping -d '{
   "entry": {
      "properties": {
         "entry_id": {
            "type": "string",
            "store": "yes",
            "index": "not_analyzed"
         },
         "title": {
            "type": "string",
            "term_vector": "yes",
            "store": "yes"
         },
         "text": {
            "type" : "string",
            "term_vector": "yes",
            "store": "yes"
         },
         "created_at": {
            "type": "date"
         },
         "updated_at": {
            "type": "date"
         }
      }
   }
}
'
