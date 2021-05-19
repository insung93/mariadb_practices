# 실습환경

xshell    
employees_db.zip 압축파일 /root 디렉터리로 옮기기    
unzip으로 압축풀기    
 # unzip employees_db.zip    
 # cd employees_db    

 # mysql -u root -p    
 
 linux에서 접근할 수 있는 계정과    
 윈도우에서 접근할수 있는 계정 생성    
 권한 부여    

```sql
create database employees

create user 'hr'@'localhost' identified by 'hr';
grant all privileges on employees.* to 'hr'@'localhost';

create user 'hr'@'192.168.%' identified by 'hr';
grant all privileges on employees.* to 'hr'@'192.168.%';

flush privileges;
```

 # mysql -u hr -D employees -p < employees.sql