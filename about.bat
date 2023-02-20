@echo off
set "hostname=%computername%"
set "os=%OS%"
set "kernel_version=%OSVersion%"
set "processor_type=%PROCESSOR_ARCHITECTURE%"
for /f "tokens=1,2" %%a in ('wmic os get TotalVisibleMemorySize /value') do if "%%a"=="TotalVisibleMemorySize" set "memory=%%b"
set "memory=%memory:~0,-3%"
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where deviceid="C:" get size /value') do set "disk_size=%%a"
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where deviceid="C:" get freespace /value') do set "free_space=%%a"
set "disk_size=%disk_size:~0,-9%"
set "free_space=%free_space:~0,-9%"
echo [Hostname: %hostname%] [Operating System: %os%] [Kernel Version: %kernel_version%] [Processor Type: %processor_type%] [Available Memory: %memory% MB] [Available Disk Space: %free_space%/%disk_size%]
