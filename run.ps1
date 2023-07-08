[CmdletBinding(SupportsShouldProcess)]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $SubscriptionId,

    [Parameter(Mandatory = $true)]
    [string]
    $ProjectName,

    [Parameter(Mandatory = $true)]
    [string]
    $AppId,

    [Parameter(Mandatory = $true)]
    [string]
    $Secret,

    [Parameter(Mandatory = $true)]
    [string]
    $PAT,

    [Parameter(Mandatory = $true)]
    [string]
    $DevOpsOrgUrl
)


$Env:AZDO_PERSONAL_ACCESS_TOKEN = $PAT
$Env:AZDO_ORG_SERVICE_URL = $DevOpsOrgUrl

terraform init

terraform plan `
    -var="subscription_id=$SubscriptionId" `
    -var="ado_project_name=$ProjectName" `
    -var="app_id=$AppId" `
    -var="app_secret=$secret"

terraform apply -auto-approve `
    -var="subscription_id=$SubscriptionId" `
    -var="ado_project_name=$ProjectName" `
    -var="app_id=$AppId" `
    -var="app_secret=$secret"