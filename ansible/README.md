### Теория
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
