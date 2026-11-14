#!/bin/bash

for IP in "8.8.8.8" "1.1.1.1" "127.0.0.1"; do
	echo "=== Проверяем сервер $IP ==="

	ping -c 1 "$IP" > /dev/null

	if [ $? -eq 0 ]; then
		echo "Сервер $IP доступен"
	else
		echo "Ошибка! Сервер $IP НЕ отвечает!"
	fi
done
