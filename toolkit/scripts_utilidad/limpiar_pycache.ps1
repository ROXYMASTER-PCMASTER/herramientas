Get-ChildItem -Recurse -Directory -Filter "__pycache__" | Remove-Item -Recurse -Force; Write-Host "pycache eliminado"
