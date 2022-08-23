
drop database link site_link;

create database link site_link
 connect to system identified by "123456"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
          (ADDRESS = (PROTOCOL = TCP)
          (HOST = 192.168.179.225)
          (PORT = 1521))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  
