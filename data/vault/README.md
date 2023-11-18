#

----

1) Инициализируем оператора:
```
docker exec -it my_vault /bin/sh -c "vault operator init"
```
2) Разлочим
```
docker exec -it my_vault /bin/sh -c "vault operator unseal <unseal key 1>"
docker exec -it my_vault /bin/sh -c "vault operator unseal <unseal key 2>"
docker exec -it my_vault /bin/sh -c "vault operator unseal <unseal key 3>"
```
3) Логинимся под root’ом, указав вместо <root token> значение рутового токена, выданого командой operator init:
```
docker exec -it my_vault /bin/sh -c "vault login <root token>"
```
4) Активируем KV движок:
```
docker exec -it my_vault /bin/sh -c "vault secrets enable -version=1 -path=secret kv"
```
