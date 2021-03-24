# create internal network by running below command
docker network create internal-network -d bridge

# run mysql container
docker run --name mysql5.7 -e MYSQL_ROOT_PASSWORD=my-secret-pw --network internal-network -d mysql:5.7

# go into mysql container
docker exec -it mysql5.7 bin/bash

# login into mysql database
mysql -uroot -p
> enter password as my-secret-pw

# create following tables (run on the prompt)
then create database and tables by running below sql.
create database storedb;
use storedb;
create table products(product_no int primary key, product_nm varchar(50));
insert into products values(1, 'Television');
insert into products values(2, 'Smart Mobile');
insert into products values(3, 'Microwave');
insert into products values(4, 'Washing Machine');
select * from products;

# build tomcat project with below command
docker build -t store:1.0 ./

# run docker inspect on mysql5.7 to find ip address
docker inspect mysql5.7

# update dbenv.env file with above ip address and run store container as below

docker container run --name tomcat9 --env-file=dbenv.env -d --network internal-network store:1.0

# docker inspect on store container to find ip address and pass it as build arguments while building the image
docker inspect store
docker build -t lb:1.0 --build-arg SITE_NM=store --build-arg TOMCAT_HOST=172.19.0.3 --build-arg TOMCAT_PORT=8080 ./


# apache2 container start
docker container run --name lb -d --network internal-network -p 8080:80 --env-file=siteenv.env lb:1.0