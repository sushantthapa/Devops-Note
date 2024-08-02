
Download the jenkins-cli.jar in your system

Create a user in jenkins and credentials or auth credentials

```
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant.chhetri@citytech.global:112287c526885770e993884c610c3d986e -webSocket help
```


command to list the pipelines jobs

```
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant:112287c526885770e993884c610c3d986e -webSocket list-jobs
```

Now, create a simple pipeline in jenkins

and copy its template using the jenkins cli and create new other template using below script 

```
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant:112287c526885770e993884c610c3d986e get-job "STAGE-FINPOS-DWARPAL" > finpos-staging.xml
```

Using this command you can create a single pipeline jobs 

```
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant:112287c526885770e993884c610c3d986e create-job "STAGE-FINPOS-SCHEMES" < finpos-staging.xml
```

In Order, to get the Jenkins command you can use
```
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant.chhetri@citytech.global:112287c526885770e993884c610c3d986e -webSocket help
```

for stage 
```
#!/bin/bash

# List of job names in uppercase
job_names=(
    "BANKING-MESSENGER"
    "MERCHANT-PORTAL-SERVICE"
    "PROCESSOR-ENDPOINTS"
    "SCHEMS"
    "USER"
    "CONFIGURATIONS"
    "MERCHANT-WEB-PORTAL"
    "QAENGINE-ADMIN-ENDPOINTS"
    "SERVICE-DISCOVERY"
    "DEPARTMENTS"
    "MESSAGING"
    "QRENGINE-ISSUER-ENDPOINTS"
    "TERMINALS"
    "DWARPAL"
    "MQTT"
    "QRENGINE-NFC-ENDPOINTS"
    "TMS"
    "IDENTITY"
    "OBJECT-STORAGE"
    "RABBITMQ"
    "TMS-PLATFORM"
    "MASTER"
    "PROCESSOR-ADMIN-ENDPOINTS"
    "REPORTS"
    "TMS-PORTAL"
)

# Jenkins CLI command template
base_command="java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant:112287c526885770e993884c610c3d986e create-job"

# Iterate over each job name in the list
for job_name in "${job_names[@]}"; do
    # Construct the full command
    command="$base_command STAGE-FINPOS-${job_name} < finpos-staging.xml"
    
    # Execute the command
    if eval $command; then
        echo "Successfully created job: STAGE-FINPOS-${job_name}"
    else
        echo "Failed to create job: STAGE-FINPOS-${job_name}"
    fi
    
    # Sleep for 5 seconds
    sleep 5
done


```


For Dev

```
job_names=(
    "BANKING-MESSENGER"
    "MERCHANT-PORTAL-SERVICE"
    "PROCESSOR-ENDPOINTS"
    "SCHEMS"
    "USER"
    "CONFIGURATIONS"
    "MERCHANT-WEB-PORTAL"
    "QAENGINE-ADMIN-ENDPOINTS"
    "SERVICE-DISCOVERY"
    "DEPARTMENTS"
    "MESSAGING"
    "QRENGINE-ISSUER-ENDPOINTS"
    "TERMINALS"
    "DWARPAL"
    "MQTT"
    "QRENGINE-NFC-ENDPOINTS"
    "TMS"
    "IDENTITY"
    "OBJECT-STORAGE"
    "RABBITMQ"
    "TMS-PLATFORM"
    "MASTER"
    "PROCESSOR-ADMIN-ENDPOINTS"
    "REPORTS"
    "TMS-PORTAL"
)

# Jenkins CLI command template
base_command="java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant:112287c526885770e993884c610c3d986e create-job"

# Iterate over each job name in the list
for job_name in "${job_names[@]}"; do
    # Construct the full command
    command="$base_command DEV-FINPOS-${job_name} < finpos-qa.xml"
    
    # Execute the command
    if eval $command; then
        echo "Successfully created job: DEV-FINPOS-${job_name}"
    else
        echo "Failed to create job: DEV-FINPOS-${job_name}"
    fi
    
    # Sleep for 5 seconds
    sleep 5
done
```

for QA

```
#!/bin/bash

# List of job names in uppercase
job_names=(
    "BANKING-MESSENGER"
    "MERCHANT-PORTAL-SERVICE"
    "PROCESSOR-ENDPOINTS"
    "SCHEMS"
    "USER"
    "CONFIGURATIONS"
    "MERCHANT-WEB-PORTAL"
    "QAENGINE-ADMIN-ENDPOINTS"
    "SERVICE-DISCOVERY"
    "DEPARTMENTS"
    "MESSAGING"
    "QRENGINE-ISSUER-ENDPOINTS"
    "TERMINALS"
    "DWARPAL"
    "MQTT"
    "QRENGINE-NFC-ENDPOINTS"
    "TMS"
    "IDENTITY"
    "OBJECT-STORAGE"
    "RABBITMQ"
    "TMS-PLATFORM"
    "MASTER"
    "PROCESSOR-ADMIN-ENDPOINTS"
    "REPORTS"
    "TMS-PORTAL"
)

# Jenkins CLI command template
base_command="java -jar jenkins-cli.jar -s http://localhost:8080/ -auth sushant:112287c526885770e993884c610c3d986e create-job"

# Iterate over each job name in the list
for job_name in "${job_names[@]}"; do
    # Construct the full command
    command="$base_command QA-FINPOS-${job_name} < finpos-qa.xml"
    
    # Execute the command
    if eval $command; then
        echo "Successfully created job: DEV-FINPOS-${job_name}"
    else
        echo "Failed to create job: DEV-FINPOS-${job_name}"
    fi
    
    # Sleep for 5 seconds
    sleep 5
done

```