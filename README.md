# docker-haproxy
docker-haproxy

# 安装docker
```
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

sudo usermod -aG docker username
```
# 使用
```
docker container list

docker pull ghostry/haproxy

docker container stop ghaproxy && docker container rm ghaproxy

wget https://raw.githubusercontent.com/easy-docker/haproxy/master/haproxy.cfg

docker run --detach \
    --publish 8388:8388 \
    --publish 8389:8389 \
    --name ghaproxy \
    --restart always \
    --volume $PWD:/usr/local/etc/haproxy \
    ghostry/haproxy
```
8389管理端口，按需

# 自己构建
```
git clone https://github.com/ghostry/docker-haproxy.git
cd docker-haproxy
docker build --no-cache  -t ghostry/haproxy .
```

