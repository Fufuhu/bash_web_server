#!/bin/bash


PORT=8080

while true; do
    echo "ポート ${PORT} で接続待機中..."
    # netcatでポートを監視し、接続があるとHTTPレスポンスを返す
    # レスポンスヘッダーと本文を出力する
    RESPONSE="HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: $(echo -n "Hello, World!" | wc -c)\r\n\r\nHello, World!"

    # バージョンによってはオプションが異なる場合があります
    # -l で待受、-p でポート指定、-q 1 は接続後1秒待って終了（GNU netcatなど）
    echo -e "$RESPONSE" | nc -l -p $PORT -q 1
done