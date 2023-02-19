CONTAINER_NAME=MariaDB
SET_SQL_PATH=/etc/mysql/setDB/setDB.sql
SET_SQL_DELAY=10
DB_ROOT_UID=root
DB_ROOT_PASSWORD=system32


echo ""
echo ""
echo "[RUN] 1. Remove Container '$CONTAINER_NAME' "
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker rmi $CONTAINER_NAME
echo ""
echo "[RUN] 2. Run Container"
docker-compose up -d
echo ""
echo "[RUN] 3. Set DB"
echo "Wait for 5 second"
sleep $SET_SQL_DELAY s
docker exec $CONTAINER_NAME sh -c "mysql -u$DB_ROOT_UID -p$DB_ROOT_PASSWORD < $SET_SQL_PATH"
echo ""
echo "[RUN COMPLETE]"
echo ""
echo ""
