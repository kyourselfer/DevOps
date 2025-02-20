#!/bin/env bash

# Список лог-файлов
LIST_OF_LOGS=$(ls -lht /var/log/postgresql_log/*.csv | awk '{print $NF}' | xargs)

# Каталог для сохранения отфильтрованных строк
OUTPUT_DIR="./filtered_logs-2025.02.06"
mkdir -p "$OUTPUT_DIR"  # Создаём директорию, если её нет

# Обработка каждого файла
for LOG_FILE in $LIST_OF_LOGS
do
    # Вывод информации о файле
    ls -lh "$LOG_FILE"
    
    # Количество строк в файле
    echo -ne "\tКол-во строк: " && wc -l "$LOG_FILE"
    
    # Найти строки длиной более 2047 символов
    echo -e "Строки длинее 2047B"
    
    # Выходной файл для отфильтрованных строк
    OUTPUT_FILE="$OUTPUT_DIR/filtered_$(basename "$LOG_FILE")"
    
    # Запись строк длиной более 2047 байт в отдельный файл
    while IFS= read -r line; do
        # Проверяем длину строки
        if [ ${#line} -gt 2047 ]; then
	    echo "Длина строки: $line == " | wc -c >> "$OUTPUT_FILE" 
            echo "$line" >> "$OUTPUT_FILE"
        fi
    done < "$LOG_FILE"
    
    # Вывод информации о результатах фильтрации
    if [ -s "$OUTPUT_FILE" ]; then
        echo -e "\tСтроки длиной более 2047B записаны в: $OUTPUT_FILE"
    else
        echo -e "\tНет строк длиной более 2047B в $LOG_FILE"
        rm -f "$OUTPUT_FILE"  # Удаляем пустой файл
    fi

    echo -e "\n"
done
