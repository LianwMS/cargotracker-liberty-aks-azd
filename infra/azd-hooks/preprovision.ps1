# Function to check if a command exists
function Test-CommandExists {
    param (
        [string]$Command,
        [string]$InstallMessage
    )

    try {
        if (Get-Command $Command -ErrorAction Stop) {
            Write-Host "✅ $Command is installed" -ForegroundColor Green
            return $true
        }
    }
    catch {
        Write-Host "❌ $Command is not installed" -ForegroundColor Red
        Write-Host "To install ${Command}:" -ForegroundColor Yellow
        Write-Host $InstallMessage -ForegroundColor Yellow
        return $false
    }
}

# Initialize error flag
$hasError = $false

# Check Maven
$mavenInstallMsg = @"
1. Download Maven from https://maven.apache.org/download.cgi
2. Extract to a directory (e.g., C:\Program Files\Apache\maven)
3. Add to Path environment variable:
   - Open System Properties > Environment Variables
   - Add Maven bin directory to Path (e.g., C:\Program Files\Apache\maven\bin)
"@
if (-not (Test-CommandExists "mvn" $mavenInstallMsg)) { $hasError = $true }

# Check Azure CLI
$azureInstallMsg = @"
1. Download and run the MSI installer from https://aka.ms/installazurecliwindows
2. Or install using winget: winget install Microsoft.AzureCLI
"@
if (-not (Test-CommandExists "az" $azureInstallMsg)) { $hasError = $true }

# Check Git
$gitInstallMsg = @"
1. Download and install from https://git-scm.com/download/win
2. Or install using winget: winget install Git.Git
"@
if (-not (Test-CommandExists "git" $gitInstallMsg)) { $hasError = $true }

# Check kubectl
$kubectlInstallMsg = @"
1. Install using winget: winget install kubectl
2. Or manually download from https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
"@
if (-not (Test-CommandExists "kubectl" $kubectlInstallMsg)) { $hasError = $true }

# Check Helm
$helmInstallMsg = @"
1. Install using winget: winget install OpenJS.Helm
2. Or using Chocolatey: choco install kubernetes-helm
3. Or manually download from https://helm.sh/docs/intro/install/
"@
if (-not (Test-CommandExists "helm" $helmInstallMsg)) { $hasError = $true }

# Final status check
Write-Host "`n=== Final Status ===" -ForegroundColor Cyan
if ($hasError) {
    Write-Host "⚠️  Please install the missing tools before proceeding." -ForegroundColor Red
    exit 1
}
else {
    Write-Host "✅ All required tools are installed!" -ForegroundColor Green
}
