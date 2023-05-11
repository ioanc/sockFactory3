# Valid values are only '18.04' and '20.04'
# For other versions of Ubuntu, please use the tar.gz package
ubuntu_release=`lsb_release -rs`
wget https://packages.microsoft.com/config/ubuntu/${ubuntu_release}/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install msopenjdk-17
sudo apt install maven

javac ./src/main/java/org/example/QuickAck.java
cp ./mssql-jdbc-12.3.0-SNAPSHOT.jre11-quickack.jar ./target/mssql-jdbc-12.2.0.jre11.jar