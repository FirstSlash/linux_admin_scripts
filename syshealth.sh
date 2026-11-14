#!/bin/bash

# Порог заполнения диска
DISK_LIMIT=80

# Какой сервис проверяется
SERVICE='docker'

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
FREE_RAM=$(free -m | awk 'NR==2 {print $7}')
SERVICE_STATUS=$(systemctl is-active "$SERVICE")

echo "=== Отчет о состоянии системы ($(date '+%H:%M:%S')) ==="
echo "Свободно ОЗУ: ${FREE_RAM}"
echo "Занято на диске (/): ${DISK_USAGE}%"

# Условие проверки диска
if [ "$DISK_USAGE" -gt "$DISK_LIMIT" ]; then
	echo "[ВНИМАНИЕ] На диске осталось мало места! Занято $(DISK_USAGE)%."
else
	echo "[OK] Места на диске достаточно."
fi

# Проверка сервиса
if [ "$SERVICE_STATUS" = "active" ]; then
	echo "[OK] Сервис $SERVICE работает штатно."
else
	echo "[ОШИБКА] Сервис $SERVICE не запущен (статус: $SERVICE_STATUS)."
fi
