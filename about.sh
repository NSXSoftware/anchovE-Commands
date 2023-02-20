echo -n "[Hostname: $(hostname) ]"
echo -n "[Operating] System: $(uname -s) ]"
echo -n "[Kernel Version: $(uname -r) ]"
echo -n "[Processor Type: $(uname -p) ]"
echo -n "[Available Memory: $(free -m | awk 'NR==2{print $4}') MB ]"
echo "[Available Disk Space: $(df -h / | awk 'NR==2{print $4}') ]"