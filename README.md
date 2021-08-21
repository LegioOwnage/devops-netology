#new line

# Локальные каталоги .terraform

# Файлы .tfstate

# Файлы журнала аварий crash.log

# Исключаем все файлы .tfvars, которые могут содержать конфиденциальные данные, такие как
# пароль, закрытые ключи и др. 

# Игнорировать файлы переопределения, так как они обычно используются для локального переопределения ресурсов и поэтому
# не проверяются override.tf

# Include override files you do wish to add to version control using negated pattern
#
# !example_override.tf

# Включить файлы tfplan для игнорирования вывода plan command: terraform plan -out=tfplan
# пример: *tfplan*

# Игнорировать файлы конфигурации CLI

