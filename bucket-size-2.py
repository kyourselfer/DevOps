import boto3
import os

# Попробуем получить учетные данные из переменных окружения
aws_access_key_id = os.getenv('AWS_ACCESS_KEY_ID', 'YOUR_ACCESS_KEY')
aws_secret_access_key = os.getenv('AWS_SECRET_ACCESS_KEY', 'YOUR_SECRET_KEY')
region_name = os.getenv('AWS_DEFAULT_REGION', 'YOUR_REGION')
endpoint_url = 'https://s3.ritm.site'  # Укажите ваш эндпоинт, если нужно

# Создайте сессию с указанными учетными данными
session = boto3.Session(
    aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key,
    region_name=region_name
)

# Создайте клиент S3
s3 = session.client('s3', endpoint_url=endpoint_url)

# Функция для получения размера бакета
def get_bucket_size(bucket_name):
    total_size = 0
    paginator = s3.get_paginator('list_objects_v2')
    
    for page in paginator.paginate(Bucket=bucket_name):
        if 'Contents' in page:
            for obj in page['Contents']:
                total_size += obj['Size']
    
    return total_size

# Получение списка бакетов и их размеров
try:
    response = s3.list_buckets()
    print("Список бакетов и их размеры:")
    
    for bucket in response['Buckets']:
        bucket_name = bucket['Name']
        size = get_bucket_size(bucket_name)
        print(f'  {bucket_name}: {size} байт')
except Exception as e:
    print(f"Произошла ошибка: {e}")
