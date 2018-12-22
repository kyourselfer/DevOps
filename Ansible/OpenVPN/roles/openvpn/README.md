OpenVPN
-------------
#### Установка и конфигурация OpenVPN для Ubuntu (Xenial)
Требования
------------

Роль требует Ansible 1.9 или выше

Запуск
------------
Возможные режимы OpenVPN:
##### TLS (server-client)
##### STATIC (p2p)
 
##### Чтобы настроить использование режима TLS:

Включить openvpn_server

Включить openvpn_client

##### Чтобы настроить использование режима STATIC (один ключ на две точки):

Включить режим openvpn_client или openvpn_server

Включить openvpn_static

На стороне клиента вы должны определить переменную openvpn_remote_host с ip адресом сервера

Переменные роли
------------
Имя | Умолчание | Описание
--- | --- | ---
openvpn_version | 2.4.6 | Версия OpenVPN
openvpn_static		| false	| Вкл. режима статич. ключей (без x509 PKI и соединение ptp) 
openvpn_client		| false | Вкл. в режим клиента
openvpn_server          | false | Вкл. в режим сервера
openvpn_clientendpoint	| 10.8.0.2 | конечный адресс клиентской стороны
openvpn_serverendpoint	| 10.8.0.1 | конечный адресс серверной стороны
openvpn_clientifconfig | "{{ openvpn_clientendpoint }} {{ openvpn_serverendpoint }}" | ifconfig задействовано в static режиме (серверная сторона)
openvpn_clientifconfig | "{{ openvpn_clientendpoint }} {{ openvpn_serverendpoint }}" | ifconfig задействовано в static режиме (клиентская сторона)
openvpn_clientpull	| false | сторона клиента разрешение на прием опций (роутинг, днс, дхсп) 
openvpn_dev	| tun | драйвер (два режима tun(3-4 уровень OSI используется в основном для шлюзов)|tap(2 уровень OSI - клиентская сетевая должна быть в той же сети куда происх. коннект))
openvpn_complzo | true | метод компрессии
openvpn_daemon | true | демонизация процесса
openvpn_dhcpoptiondns | ["208.67.222.222", "208.67.220.220"] | днс сервера для пушиния на клиента
openvpn_ifconfigpoolpersist | ipp.txt | для хранения базы клиентов ifconfig-pool (для получения одних и тех же ip, ключевое поле CN в открытом ключе клиента)
openvpn_keepalive | 10 60 | таймауты
openvpn_nobind | true | не слушать локальный интерфейс и порт
openvpn_nscerttype | '' | явное указание в сертификате поля nsCertType "client" или "server"
openvpn_persistkey | true | при перезапуске процесса OpenVPN не перечитывает закрытые ключи (не перечитывать закрытые ключи через SIGUSR1)
openvpn_persisttun| true | при перезапуске процесса OpenVPN не перезапускает драйвер (не закрывать и не переоткрывать драйвер TUN|TAP через SIGUSR1)
openvpn_proto | udp | какой протокол использовать для соединения(tcp рекомендуют за NAT или proxy(CONNECT|SOCKS))
openvpn_redirectgateway | false | шлюз по умолчанию удаленный сервер
openvpn_remotehost | '' | доменное имя или ip хоста для подключения
openvpn_remoteport | '1195' | удаленный номер порта
openvpn_remoteproto | "{{ openvpn_proto }}" | протокол удаленного хоста
openvpn_resolvretry | infinite | если имя хоста не преобразуется, попытаться преобразовать в течении указанного времени (сек.)
openvpn_secret | '' | секретный закрытый ключ для режима openvpn_static
openvpn_serversubnet | 10.8.0.0 | подсеть для соединений
openvpn_serversubnetmask | 255.255.255.0 | маска подсети для соединений
openvpn_status | openvpn-status.log | путь и имя статус файла
openvpn_verb | 1 | уровень подробности логов (по умолчанию вывод в journald)
openvpn_cacertificate | '' | открытый ключ авторитетного цента сертификации(CA) (подписываем закрытым ключем CA)
openvpn_clientcertificate | '' |  открытый ключ клиента
openvpn_clientkey | '' | закрытый ключ клиента
openvpn_renegsec | 259200 | повторная аунтификация через определённый временной интервал
Лицензия
-------------

BSD

Автор
-------------
Елисеев В.А.

