OpenVPN
-------------
#### Установка и конфигурация OpenVPN
Требования
-------------
Роль требует Ansible 1.9 или выше
Запуск
------------
Чтобы настроить с использованием режима static (один ключ на две точки):

Включить openvpn_static
Включить режим openvpn_client или openvpn_server
Если это клиент вы должны определить переменную openvpn_remote_host ip адресом сервера

Чтобы настроить с использованием режима TLS server:

Включить openvpn_server

Чтобы включить TLS client:

Включить openvpn_client

Переменные роли
------------
Имя | Умолчание | Описание
--- | --- | ---

ansible-openvpn_version | 2.4.6 | Версия OpenVPN
openvpn_static		| false	| Вкл. режима статич. ключей (без x509 PKI и соединение ptp) 
openvpn_client		| false | Вкл. в режим клиента
openvpn_server          | false | Вкл. в режим сервера
openvpn_client_endpoint	| 10.8.0.2 | конечный адресс клиентской стороны
openvpn_server_endpoint	| 10.8.0.1 | конечный адресс серверной стороны
openvpn_client_ifconfig | "{{ openvpn_client_endpoint }} {{ openvpn_server_endpoint }}" | ifconfig задействовано в static режиме (серверная сторона)
openvpn_client_ifconfig | "{{ openvpn_client_endpoint }} {{ openvpn_server_endpoint }}" | ifconfig задействовано в static режиме (клиентская сторона)
openvpn_client_pull	| false | сторона клиента разрешение на прием опций (роутинг, днс, дхсп) 
openvpn_dev	| tun | драйвер (два режима tun(3-4 уровень OSI используется в основном для шлюзов)|tap(2 уровень OSI - клиентская сетевая должна быть в той же сети куда происх. коннект))
openvpn_comp_lzo | true | метод компрессии
openvpn_daemon | true | демонизация процесса
openvpn_dhcp_option_dns | ["208.67.222.222", "208.67.220.220"] | днс сервера для пушиния на клиента
openvpn_ifconfig_pool_persist | ipp.txt | для хранения базы клиентов ifconfig-pool (для получения одних и тех же ip, ключевое поле CN в открытом ключе клиента)
openvpn_keepalive | 10 60 | таймауты
openvpn_nobind | true | не слушать локальный интерфейс и порт
openvpn_nscerttype | '' | явное указание в сертификате поля nsCertType "client" или "server"
| скрыть факт использования шифрования аутентификация по симметричному ключу 
...

Лицензия
-------------
BSD
Автор
-------------
Елисеев В.А.

