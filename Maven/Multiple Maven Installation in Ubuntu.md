You can switch between java version using this command
```
sudo update-alternatives --config java

```


First, Download and install the maven version here i have install 3.6.3 and 3.8.5
```sh
wget https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xvzf apache-maven-3.6.3-bin.tar.gz
sudo mv apache-maven-3.6.3 /opt/maven-3.6.3

```

```sh
wget https://archive.apache.org/dist/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
tar -xvzf apache-maven-3.8.5-bin.tar.gz
sudo mv apache-maven-3.8.5 /opt/maven-3.8.5

```

here, update the maven options
```sh
sudo update-alternatives --install /usr/bin/mvn mvn /opt/maven-3.6.3/bin/mvn 1

```

```sh
sudo update-alternatives --install /usr/bin/mvn mvn /opt/maven-3.8.5/bin/mvn 2


```

use this command to switch between maven
```sh
sudo update-alternatives --config mvn
mvn -version

```


