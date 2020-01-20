## Теория
" Теперь выполните ansible app -m command -a 'rm -rf~/reddit'  и  проверьте  еще  раз  выполнение  плейбука.  Чтоизменилось и почему? Добавьте информацию в README.md. "

1 вариант ``` changed=0 ``` ноль изменений так как директория reddit уже существует, на лицо идемпотентность модулей ansible

```
PLAY RECAP ************************************************************************************
appserver                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
2 вариант ``` changed=1 ```  одно изменение, выполнен git clone 
```
PLAY RECAP ************************************************************************************
appserver                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
### Примитивный скрипт для динамической инвентаризации
``` ansible app  -m ping -i dynamic_inventory.sh ```
Вывод
```
34.77.155.246 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
```
### Формируется такой json:
``` ./dynamic_inventory.sh --list ```

```
{
    "app": {
        "hosts": ["34.77.155.246"],
    },
    "db": {
        "hosts": ["35.240.64.63"],
    },
    "_meta": {
            "hostvars": {}
        }
}
```
При указании  ``` inventory = dynamic_inventory.sh ```  в ``` ansible.cfg ```  тесты travis не пороходят, хотя локально все отрабатываетя. Вернул на ``` inventory = ./inventory  ```