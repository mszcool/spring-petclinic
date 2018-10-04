Write-Host "Starting application with maven run..."
Write-Host "Reading parameters from environment..."

if($env:MYSQLHOST) {
    $mysqlhost = $env:MYSQLHOST
} else {
    $mysqlhost="jdbc:mysql://localhost/petclinic_db"
}

if($env:MYSQLUSER) {
    $mysqluser = $env:MYSQLUSER
} else {
    $mysqluser = "petclinic"
}

if($env:MYSQLPWD) {
    $mysqlpwd = $env:MYSQLPWD
} else {
    $mysqlpwd = "pass@word1"
}

if($env:APPINSIGHTSKEY) {
    $appinsightskey = $env:APPINSIGHTSKEY
} else {
    $appinsightskey = ""
}

#
# Start the application using maven run
#
$springbootargs = "-Dspring-boot.run.arguments="
$springbootargs += "--spring.datasource.url=$mysqlhost"
$springbootargs += ",--spring.datasource.username=$mysqluser"
$springbootargs += ",--spring.datasource.password=$mysqlpwd"
if($appinsightskey) {
    $springbootargs += ",--azure.application-insights.enabled=true,--azure.application-insights.instrumentation-key=$appinsightskey"
} else {
    $springbootargs += ",--azure.application-insights.enabled=false"
}

$cmdToExec = "mvn spring-boot:run '$springbootargs'"

Invoke-Expression $cmdToExec