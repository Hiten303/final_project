Write-Host "==============================="
Write-Host "Running Pabot Tests"
Write-Host "==============================="

# Force execution + capture output
# $pabotCmd = "robot -d reports --listener allure_robotframework tests"
$pabotCmd = "pabot --processes 4 -d reports --listener allure_robotframework tests"
cmd /c $pabotCmd

# Capture exit code safely
$exitCode = $LASTEXITCODE
Write-Host "Pabot Exit Code: $exitCode"

if ($exitCode -ne 0) {
    Write-Host "Tests failed but continuing to generate report..."
}

Write-Host "==============================="
Write-Host "Generating Allure Report"
Write-Host "==============================="

cmd /c "allure generate output/allure --clean -o allure-report"

Write-Host "==============================="
Write-Host "Opening Allure Report"
Write-Host "==============================="

cmd /c "allure open allure-report"