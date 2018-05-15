## jenkins

```docker
docker run -d -p 8080:8080 -v ~/jenkins:/var/jenkins_home jenkinsci/blueocean
```

## sonarqube

```docker
docker run -d -p 9000:9000 -v ~/.sonarqube:/opt/sonarqube/data sonarqube
```

- (default) Database: H2 
- (default) Login: admin/admin 
