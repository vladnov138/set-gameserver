# set-gameserver  
Server for game "set"  
  
This instruction are actual for Ubuntu 20.04.  
For deploying the server do the next steps:  
1. Be sure you have downloaded docker, docker compose and composer.  

2. Go to the home directory and download the server zip archive:  
```
cd ~
curl -L https://github.com/do-community/travellist-laravel-demo/archive/tutorial-1.0.1.zip -o travellist.zip
```

3. Download the unzip utilite:  
```
sudo apt update
sudo apt install unzip
```

4. Unzip the archive:
```
unzip travellist.zip
mv travellist-laravel-demo-tutorial-1.0.1 travellist-demo
```

5. Go to the server directory:
```
cd travellist-demo
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

8. Write the next values and write your database host name, database, username and password:
```
APP_NAME=Travellist
APP_ENV=dev
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost:8000

LOG_CHANNEL=stack

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=travellist
DB_USERNAME=travellist_user
DB_PASSWORD=password
```

9. Build the server:
```
docker-compose build app
```

10. Create the dependicies:
```
docker-compose exec app composer install
```

11. Start the server:
```
docker-compose up -d
```

You may find the information about server services via:
```
docker-compose ps
```
