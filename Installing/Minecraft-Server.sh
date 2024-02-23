adduser minecraft #create minecraft user for server
passwd minecraft #create passord for minecraft user
usermod -a -G wheel minecraft #give minecraft user sudo privages 
su - minecraft 
java -version #check if you have java installed and see what version it is
sudo yum install -y epel-release #install epel-release 
sudo yum install -y java-latest-openjdk #install the latest java version
alternatives --config java #ensure the latest java version is selected
firewall-cmd --zone=public --add-port=25565/tcp --permanent #allow access through port 25565
firewall-cmd --reload #make sure the firewall rules are implemented
mkdir minecraft_server && cd minecraft_server #make minecraft srever directory and change to the directory
wget https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar #download minecraft server.jar file
ava -Xmx1024M -Xms1024M -jar server.jar nogui #start minecraft server
vim eula.txt # eula=true
java -Xmx1024M -Xms1024M -jar server.jar nogui #start minecraft server again and change Xmx to the amount of ram you want to be used
