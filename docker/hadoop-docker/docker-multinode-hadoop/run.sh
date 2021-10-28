#Create a network named "hadoopNetwork"
docker network create -d bridge   --subnet 172.25.0.0/16  hadoopNetwork

#run base-hadoop:1.0 image  as master container
docker run -itd  --network="hadoopNetwork"  --ip 172.25.0.100  -p 50070:50070  -p 8088:8088 --name master --hostname master  zyh6158/base-hadoop

tmpName="slave1"
#run base-hadoop:1.0 image  as slave container
docker run -itd  --network="hadoopNetwork"  --ip "172.25.0.101" --name $tmpName --hostname $tmpName  zyh6158/base-hadoop

tmpName="slave2"
#run base-hadoop:1.0 image  as slave container
docker run -itd  --network="hadoopNetwork"  --ip "172.25.0.102" --name $tmpName --hostname $tmpName  zyh6158/base-hadoop

#run hadoop commands
docker exec -ti master bash  -c "hadoop namenode -format && /usr/local/hadoop/sbin/start-dfs.sh && /usr/local/hadoop/sbin/start-yarn.sh"
#docker exec -ti master bash
