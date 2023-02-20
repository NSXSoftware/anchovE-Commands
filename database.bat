@echo off
setlocal EnableDelayedExpansion

set "PGREP=0"
tasklist /fi "imagename eq postgres.exe" 2>NUL | find /i /c "postgres.exe" >NUL && set /a PGREP+=1
if %PGREP% neq 0 (
  echo PostgreSQL ^| %PGREP% ^| N/A
)

set "MYSQL=0"
for /f "tokens=3 delims=: " %%a in ('netstat -ano ^| find /i "3306" ^| find /i "listening"') do (
  set /a MYSQL+=1
)
if %MYSQL% neq 0 (
  set "UPTIME="
  for /f "tokens=1,2,3,4" %%a in ('tasklist /fi "imagename eq mysqld.exe" /v /fo list ^| find /i "uptime"') do (
    set "UPTIME=%%a %%b %%c %%d"
  )
  echo MySQL ^| %MYSQL% ^| Uptime %UPTIME%
)

set "MONGO=0"
tasklist /fi "imagename eq mongod.exe" 2>NUL | find /i /c "mongod.exe" >NUL && set /a MONGO+=1
if %MONGO% neq 0 (
  echo MongoDB ^| %MONGO% ^| N/A
)

set "REDIS=0"
tasklist /fi "imagename eq redis-server.exe" 2>NUL | find /i /c "redis-server.exe" >NUL && set /a REDIS+=1
if %REDIS% neq 0 (
  echo Redis ^| %REDIS% ^| N/A
)

endlocal
