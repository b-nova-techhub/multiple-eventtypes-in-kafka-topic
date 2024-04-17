register-techup-schema:
	@curl -X POST "http://localhost:8081/subjects/techup/versions" \
     -H "Content-Type: application/vnd.schemaregistry.v1+json" \
     --data '{ \
       "schemaType": "AVRO", \
       "schema": "{ \
         \"type\": \"record\", \
         \"name\": \"Techup\", \
         \"namespace\": \"com.bnova\", \
         \"fields\": [ \
           { \"name\": \"title\", \"type\": \"string\", \"default\": \"\", \"doc\": \"The title of the techup.\" }, \
           { \"name\": \"slug\", \"type\": \"string\", \"default\": \"\", \"doc\": \"A URL-friendly version of the title for linking.\" }, \
           { \"name\": \"author\", \"type\": \"string\", \"default\": \"\", \"doc\": \"The name of the author of the techup.\" }, \
           { \"name\": \"content\", \"type\": \"string\", \"default\": \"\", \"doc\": \"The main content of the techup.\" }, \
           { \"name\": \"description\", \"type\": \"string\", \"default\": \"\", \"doc\": \"A brief description of the techup.\" } \
         ] \
       }" \
     }'

register-decodify-schema:
	@curl -X POST "http://localhost:8081/subjects/decodify/versions" \
     -H "Content-Type: application/vnd.schemaregistry.v1+json" \
     --data '{ \
       "schemaType": "AVRO", \
       "schema": "{ \
         \"type\": \"record\", \
         \"name\": \"Decodify\", \
         \"namespace\": \"com.bnova\", \
         \"fields\": [ \
           { \"name\": \"episode\", \"type\": \"int\", \"default\": 0, \"doc\": \"The episode number.\" }, \
           { \"name\": \"season\", \"type\": \"int\", \"default\": 0, \"doc\": \"The season number.\" }, \
           { \"name\": \"topic\", \"type\": \"string\", \"default\": \"\", \"doc\": \"The main topic of the episode.\" }, \
           { \"name\": \"attendees\", \"type\": {\"type\": \"array\", \"items\": \"string\"}, \"default\": [], \"doc\": \"A list of attendees or participants in the episode.\" }, \
           { \"name\": \"description\", \"type\": \"string\", \"default\": \"\", \"doc\": \"A brief description of the episode.\" } \
         ] \
       }" \
     }'

register-bnova-techhub-schema:
	@curl -X POST "http://localhost:8081/subjects/bnova-techup.command-topic.v1-value/versions" \
     -H "Content-Type: application/vnd.schemaregistry.v1+json" \
     --data '{"schemaType": "AVRO", "schema": "{\"type\": \"record\", \"name\": \"BnovaTechhub\", \"namespace\": \"com.bnova\", \"fields\": [{\"name\": \"TechupDetails\", \"type\": \"com.bnova.Techup\"}, {\"name\": \"DecodifyDetails\", \"type\": \"com.bnova.Decodify\"}]}","references": [{"name": "Techup", "subject": "techup", "version": 1}, {"name": "Decodify", "subject": "decodify", "version": 1}]}'


register-techup-schema_old:
	@curl -X POST "http://localhost:33610/apis/registry/v2/groups/bnova-techup-producer/artifacts" \
  -H "Content-Type: application/json" \
  -d '{"namespace": "com.bnova", "type": "record", "name": "Techup", "fields": [{"name": "title", "type": "string"}, {"name": "slug", "type": "string"}, {"name": "author", "type": "string"}, {"name": "content", "type": "string"}, {"name": "description", "type": "string"}]}" \
	}'


# curl -X DELETE http://localhost:8081/subjects/bnova-techup.command-topic.v1-value/versions/
# curl -X DELETE http://localhost:8081/subjects/decodify/versions/
# curl -X DELETE http://localhost:8081/subjects/techup/versions/
# curl -X PUT -H "Content-Type: application/json" --data '{"compatibility": "NONE"}' http://localhost:8081/config/bnova-techup.command-topic.v1-value
