#!/bin/bash


PORT=${PORT:-8080}
OUTBOUND_IP=$(curl -s https://httpbin.org/ip | jq -r .origin)
echo ${OUTBOUND_IP}

while true; do
    echo "ポート ${PORT} で接続待機中..."
    # netcatでポートを監視し、接続があるとHTTPレスポンスを返す
    # レスポンスヘッダーと本文を出力する


    RESPONSE="HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: $(echo -n "${OUTBOUND_IP}" | wc -c)\r\n\r\n${OUTBOUND_IP}"
    echo $RESPONSE

    # バージョンによってはオプションが異なる場合があります
    # -l で待受、-p でポート指定、-q 1 は接続後1秒待って終了（GNU netcatなど）
    echo -e "$RESPONSE" | nc -lk -p $PORT -q 1
done
