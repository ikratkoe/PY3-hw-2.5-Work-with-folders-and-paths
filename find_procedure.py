
# заготовка для домашней работы
# прочитайте про glob.glob
# https://docs.python.org/3/library/glob.html

# Задание
# мне нужно отыскать файл среди десятков других
# я знаю некоторые части этого файла (на память или из другого источника)
# я ищу только среди .sql файлов
# 1. программа ожидает строку, которую будет искать (input())
# после того, как строка введена, программа ищет её во всех файлах
# выводит список найденных файлов построчно
# выводит количество найденных файлов
# 2. снова ожидает ввод
# поиск происходит только среди найденных на этапе 1
# 3. снова ожидает ввод
# ...
# Выход из программы программировать не нужно.
# Достаточно принудительно остановить, для этого можете нажать Ctrl + C

# Пример на настоящих данных

# python3 find_procedure.py
# Введите строку: INSERT
# ... большой список файлов ...
# Всего: 301
# Введите строку: APPLICATION_SETUP
# ... большой список файлов ...
# Всего: 26
# Введите строку: A400M
# ... большой список файлов ...
# Всего: 17
# Введите строку: 0.0
# Migrations/000_PSE_Application_setup.sql
# Migrations/100_1-32_PSE_Application_setup.sql
# Всего: 2
# Введите строку: 2.0
# Migrations/000_PSE_Application_setup.sql
# Всего: 1

# не забываем организовывать собственный код в функции
# на зачёт с отличием, использовать папку 'Advanced Migrations'

import glob
import os.path
import chardet

# распознование кодировки
def check_encoding(fname):
   rawdata = open(fname, "rb").read()
   result = chardet.detect(rawdata)
   return result['encoding']


def file_filter(files):
    filtered = []
    print("Введите строку для поиска:")
    targetstr = input()
    cnt = 0
    for file in files:
        cod = check_encoding(file)
        with open(file, encoding=cod) as f:
            for l in f:
                if targetstr in l:
                    cnt += 1
                    print(file)
                    filtered.append(file)
                    break
    return (cnt, filtered)

migrations1 = "Migrations"
migrations2 = "Advanced Migrations"

print("Выберите Migrations или Advanced Migrations, введите M или A")
while True:
    fld = input().upper()
    if fld == 'M' or fld == 'A': break
if fld == 'M' : migrations = migrations1
else : migrations = migrations2

files = glob.glob(os.path.join(migrations, "*.sql"))

while True:
    cnt, files = file_filter(files)
    print("Совпадения найдены в " , cnt, " файлах")






