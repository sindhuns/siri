#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
for i in `seq $cont_count`
do
	echo "======================================="
	echo "creating www.siri$i container.."
	docker run -it --name www.siri$i -d --rm sindhuns/siri-img /bin/bash
	echo "www.siri$i container has been created !!"
	echo "======================================="
done
docker inspect -f {{.NetworkSettings.Networks.bridge.IPAddress}} `docker ps -n$cont_count -q` >>ip.txt

