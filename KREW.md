

```
```


```sh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```



```
@echo off
setlocal

rem Define the webhook URL
set WEBHOOK_URL=https://chat.googleapis.com/v1/spaces/AAAAp6lCQnw/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=4U-9G607J-qy1r1kxDzr-lQlf3n00lAlKPIMpOFA8us

rem Define messages for success and failure
set SUCCESS_MESSAGE=Build %JOB_NAME% - #%BUILD_NUMBER% succeeded. Check console output at %BUILD_URL%
set FAILURE_MESSAGE=Build %JOB_NAME% - #%BUILD_NUMBER% failed. Check console output at %BUILD_URL%

rem Check if the build was successful
if "%BUILD_STATUS%"=="SUCCESS" (
    curl -X POST -H "Content-Type: application/json" -d "{\"text\": \"%SUCCESS_MESSAGE%\"}" %WEBHOOK_URL%
) else (
    curl -X POST -H "Content-Type: application/json" -d "{\"text\": \"%FAILURE_MESSAGE%\"}" %WEBHOOK_URL%
)

endlocal

```