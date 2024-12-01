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


### Buffett Qs
1. after loading document, how to get the title, publisher, date? by LLM?
2. 