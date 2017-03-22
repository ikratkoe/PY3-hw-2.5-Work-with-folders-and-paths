
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


def compare_files(f1, f2):
   # cod1 = check_encoding(f1)
   # cod2 = check_encoding(f2)
    difrnts = []
    cnt = 0
    with open(f1) as ff1:
        with open((f2)) as ff2:
            for l1 in ff1:
                cnt += 1
                l2 = next(ff2)
                if l1 != l2:
                    print("файлы {}  .. и ..  {} не совпадают в строке ... {}".format(ff1, ff2, cnt))
                    difrnts.append(cnt)
    return(difrnts)


def file_filter(files):
    filtered = []
    print("Введите текст для поиска:")
    targetstr = input()
    cnt = 0
    for file in files:
        with open(file) as f:
            for l in f:
                if targetstr in l:
                    print("Совпадение найдено в файле {}".format(file))
                    cnt +=1
                    filtered.append(file)
                    break
            else: files.remove(file)
    return (cnt, filtered)

migrations1 = 'Migrations'
migrations2 = 'Advanced Migrations'

files1 = glob.glob(os.path.join(migrations1, "*.sql"))
# files2 = glob.glob(os.path.join(migrations2, "*.sql"))
#
#
# for f1, f2 in zip(files1, files2):
#    lstdif = compare_files(f1, f2)
#
# if lstdif == [] :
#    print("файлы {}  .. и ..  {} совпадают".format(files1, files2))
# else :
#    for i in range(len(lstdif)):
#       print("строка - ", i)

while True:
    print("Выбрано файлов ", len(files1))
    cnt, files = file_filter(files1)
    for file in files:
        print(file)
    print("Совпадения найдены в " , cnt, " файлах")






