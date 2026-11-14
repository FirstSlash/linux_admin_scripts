#!/bin/bash

if [ -z "$1" ]; then
	echo "Ошибка! Укажите название сервиса. Пример: ./check_service.sh nginx"
	exit 1
fi

LOG_PATH="/var/log/$1.log"

if [ -f "$LOG_PATH" ]; then
	echo "Лог-файл для $1 найден: $LOG_PATH"
else
	echo "Внимание: Лог-файл $LOG_PATH не существует."
fi
