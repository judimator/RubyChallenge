# Installation
Build docker's container
```
docker-compose run ruby rails new . --force --database=postgresql
sudo chown -R $USER:$USER .
docker-compose build
```
Start docker
```
docker-compose up
```
Check if all containers is started
```
docker ps
```
Run migrations and load fixtures
```
docker-compose run ruby rake db:migrate
docker-compose run ruby rake db:seed
```