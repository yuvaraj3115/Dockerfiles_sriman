function checkApache2HealthCheck() {
    local exitCode=0
    nc -vz localhost 80
    exitCode=$?
    return exitCode
}
checkApache2HealthCheck
isRunning=$?
if [ $isRunning -eq 0 ]
then
    echo ""
else
    exit 1
fi