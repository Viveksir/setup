#Java-maven-Git-Tomcat-Jenkins Configuration

#login to root
#echo login to root
#sudo -i

sshpass -p "123" ssh -o StrictHostKeyChecking=no satya@172.17.0.2

#install wget downloaded #adduser.
apt-get update 
echo install wget downloaded.
apt-get install wget -y
apt-get install vim -y
useradd -m -d /home/sai -s /bin/bash sai
echo "sai:sai" | chpasswd
sed -i '21i sai    ALL=(ALL:ALL) ALL' /etc/sudoers
cd /home/sai
mkdir distros
chmod 777 -R distros
#===========================JAVA INSTALLATION START==========================================

#JAVA Setup
echo JAVA Setup
#download JDK tar.gz
echo download JDK tar.gz

echo "download JDK1.8"

#! /bin/bash -
if [[ ! -e /home/sai/distros/jdk-8u141-linux-x64.tar.gz ]]; then
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz


fi

#wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz

# move folder

mv jdk-8u141-linux-x64.tar.gz /home/sai/distros/

#Unzip tar file
cd /home/sai/distros/
echo Unzip tar file
tar zxpvf jdk-8u141-linux-x64.tar.gz



#Setup 
#export JAVA_HOME=/home/sai/distros/jdk-8u141
 # export JAVA_HOME=home/sai/distros/jdk-8u141

#export $JAVA_HOME

#export PATH=$JAVA_HOME/bin:$PATH

#Check java
#echo Check the java version
#java -version

#Maven Setup:
echo Maven Setup:

echo "Download maven"


if [[ ! -e /home/sai/distros/apache-maven-3.6.0-bin.tar.gz ]]; then
wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz    
fi


# move folder

mv apache-maven-3.6.0-bin.tar.gz /home/sai/distros/

#Unzip tar file
cd /home/sai/distros/
echo Unzip tar file
tar zxpvf apache-maven-3.6.0-bin.tar.gz




echo maven home: /home/sai/distros/apache-maven-3.6.0

#Setup Maven

#export MAVEN_HOME=/home/sai/distros/apache-maven-3.6.0


#Tomcat Setup:
echo Tomcat Setup:
#Download Tomcat

echo "download Tomcat"

if [[ ! -e /home/sai/distros/apache-tomcat-8.5.38.tar.gz ]]; then
    
wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz
fi


# move folder

mv apache-tomcat-8.5.38.tar.gz /home/sai/distros/

#Unzip tar file
echo Unzip tar file
tar zxpvf apache-tomcat-8.5.38.tar.gz

chmod 777 -R apache-tomcat-8.5.38

#Move to folder
#echo Move to folder
#mv apache-tomcat-8.5.38 tomcat7



#Jenkins Setup:
echo Jenkins Setup:

#Download Jenkins
echo Download Jenkins

if [[ ! -e /home/sai/distros/apache-tomcat-8.5.38/webapps/jenkins.war ]]; then
    
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
fi



# move folder

mv jenkins.war /home/sai/distros/apache-tomcat-8.5.38/webapps/


#Deploy war to tomcat
#echo Deploy war to tomcat
#mv /home/sai/distros/jenkins.war home/sai/distros/apache-tomcat-8.5.38/webapps/



#Git Setup:
echo Git Setup:
#Git Install
echo Git Install
apt-get install -y git

#GitHome: /usr/bin/git  (sudo find  /  -name "git" -- to search with command)
#echo GitHome: /usr/bin/git  (sudo find  /  -name "git" -- to search with command)

#Git Version
echo Git Version
git --version

#Setup 
echo export JAVA_HOME=/home/sai/distros/jdk1.8.0_141 >> .bashrc
echo export M2_HOME=/home/sai/distros/apache-maven-3.6.0 >> .bashrc
echo 'export PATH="$JAVA_HOME/bin:$M2_HOME/bin:$PATH"' >> .bashrc

source .bashrc


apt-get install -y openssh-server
service ssh start 
# versions

mvn -v 
java -version


# start tomcat 

 /home/sai/distros/apache-tomcat-8.5.38/bin/startup.sh

#echo "tomcat started"

hostname -i








