source "common.sh"

curl -XPOST ${SERVER?}/${NAME?}/comment/_mapping -d '{
   "comment": {
      "properties": {
         "entry_id": {
            "type": "string",
            "store": "yes",
            "index": "not_analyzed"
         },
         "user_id": {
            "type": "string",
            "store": "yes",
            "index": "not_analyzed"
         },
         "created_at": {
            "type": "date",
            "index": "not_analyzed"
         },
         "updated_at": {
            "type": "date",
            "index": "not_analyzed"
         },
         "text": {
            "type": "string",
            "store": "yes",
            "term_vector": "yes"
         }
      }
   }
}
'
