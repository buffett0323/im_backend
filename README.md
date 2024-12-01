### Backend run methods
```bash
node server.js
```


### Testing commands
```bash
curl -X POST http://localhost:3000/graph_rag/send_query \ 
-H "Content-Type: application/json" \
-d '{"query": "What is the most significant attitudes transition?"}'
```


### Instructions
1. Load the ```sql/DB.sql``` into postgres
2. Get env done