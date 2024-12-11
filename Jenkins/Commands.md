```
- name: RABBITMQ_USERNAME

value: rabit

- name: RABBITMQ_PASSWORD

value: Rabbitmq123

- name: RABBITMQ_VM_MEMORY_HIGH_WATERMARK

value: '0.5'

- name: RABBITMQ_DISK_FREE_RELATIVE_LIMIT

value: '1'

- name: RABBITMQ_DISK_FREE_ABSOLUTE_LIMIT

value: 1GB
```


```
echo "City@123" | docker login $REGISTRY_HARBOR --username "sushantchettri" --password-stdin

```



install jira plugins
```
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant:112287c526885770e993884c610c3d986e -webSocket install-plugin jira:3.13
```