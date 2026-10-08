#!/bin/bash

project_name="my-project"
files=("README.txt" "config.txt" "data.txt")

create_project() {
    mkdir -p "$project_name"
    for file in "${files[@]}"; do
        touch "$project_name/$file"
    done
}

check_project() {
    if [ -d "$project_name" ]; then
        echo "Папка проекта создана: $project_name"
    else
        echo "Ошибка: папка проекта не создана"
        return 1
    fi
}

echo "Введите имя автора:"
read author

mkdir -p reports

create_project
check_project

echo "Автор: $author" > reports/report.txt
echo "Проект: $project_name" >> reports/report.txt
echo "Созданные файлы:" >> reports/report.txt

for file in "${files[@]}"; do
    echo "$project_name/$file" >> reports/report.txt
done

echo "Количество файлов: ${#files[@]}" >> reports/report.txt
echo "Дата запуска: $(date)" >> reports/report.txt

echo
echo "Результат:"
ls -l "$project_name"
echo
echo "Отчёт:"
cat reports/report.txt
