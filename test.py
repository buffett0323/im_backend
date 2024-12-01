import psycopg2

try:
    connection = psycopg2.connect(
        host="localhost",
        port=5432,
        database="insightLink",
        user="postgres",
        password="910323"
    )
    print("連線成功！")
except Exception as e:
    print(f"連線失敗: {e}")