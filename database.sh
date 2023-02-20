if [[ $(command -v pgrep) ]]; then
  PGREP=$(pgrep -c '')
  if [ $PGREP -ne 0 ]; then
    echo "PostgreSQL|$PGREP|N/A"
  fi
fi

if [[ $(command -v mysqladmin) ]]; then
  MYSQL=$(mysqladmin ping 2>/dev/null)
  if [ "$MYSQL" = "mysqld is alive" ]; then
    UPTIME=$(mysqladmin status 2>/dev/null | awk '/Uptime/ {print $2,$3,$4}')
    echo "MySQL|$MYSQL|Uptime $UPTIME"
  fi
fi

if [[ $(command -v mongod) ]]; then
  MONGO=$(ps -ef | grep -c mongod)
  if [ $MONGO -ne 0 ]; then
    echo "MongoDB|$MONGO|N/A"
  fi
fi

if [[ $(command -v redis-server) ]]; then
  REDIS=$(ps -ef | grep -c redis-server)
  if [ $REDIS -ne 0 ]; then
    echo "Redis|$REDIS|N/A"
  fi
fi
