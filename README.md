# set-gameserver  
Server for game "set"  
  
This instruction are actual for Ubuntu 20.04.  
For deploying the server do the next steps:  
1. Be sure you have downloaded docker, docker compose and composer.  

2. Go to the home directory and download the server zip archive:  
```
cd ~
curl -L https://github.com/vladnov138/set-gameserver/archive/refs/heads/set-server-via-db.zip -o set-gameserver.zip
```

3. Download the unzip utilite:  
```
sudo apt update
sudo apt install unzip
```

4. Unzip the archive:
```
unzip set-gameserver.zip
mv set-gameserver-set-server-via-db set-gameserver
```

5. Go to the server directory:
```
cd set-gameserver
```

6. Set the .env file. Make the .env.example copy and name it as .env:
```
cp .env.example .env
```

7. Open the .env file:
```
nano .env
```
You may use vim or another text editors instead of nano.

8. Write your database, username and password:
```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=database
DB_USERNAME=username
DB_PASSWORD=password
```
***DON'T CHANGE THE DB_HOST IF YOU DON'T CHANGE THE DOCKER-COMPOSE.YAML***

9. Build the server:
```
docker-compose build app
```

10. Start the server:
```
docker-compose up -d
```

11. Create the dependicies:
```
docker-compose exec app composer install
```

You may find the information about server services via:
```
docker-compose ps
```
  
- This instruction was made according by [article](https://www.digitalocean.com/community/tutorials/how-to-install-and-set-up-laravel-with-docker-compose-on-ubuntu-20-04-ru)
