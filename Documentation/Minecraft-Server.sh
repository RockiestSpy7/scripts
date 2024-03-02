#-----------------------------------------------------#
# Install and Configure a Minecraft server on CentOS8 #
#-----------------------------------------------------#

# Create a user named 'minecraft' for the server
adduser minecraft

# Set a password for the 'minecraft' user
passwd minecraft

# Check if Java is installed and view its version
java -version

# Install the EPEL repository
sudo yum install -y epel-release

# Install the latest version of OpenJDK (Java)
sudo yum install -y java-latest-openjdk

# Ensure the latest Java version is selected
alternatives --config java

# Allow access through port 25565 for Minecraft
firewall-cmd --zone=public --add-port=25565/tcp --permanent
firewall-cmd --reload

# Switch to the 'minecraft' user
su - minecraft

# Create a directory for the Minecraft server and navigate to it
mkdir minecraft_server && cd minecraft_server

# Download the Minecraft server.jar file
wget https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar

# Launch the Minecraft server to download necessary files
java -Xmx1024M -Xms1024M -jar server.jar nogui

# Change 'eula=false' to 'eula=true' in the eula.txt file
sed -i 's/false/true/g' eula.txt

# Start the Minecraft server again, adjusting Xmx and Xms for desired RAM usage
java -Xmx1024M -Xms1024M -jar server.jar nogui


