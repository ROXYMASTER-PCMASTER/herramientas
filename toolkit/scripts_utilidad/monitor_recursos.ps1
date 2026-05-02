Get-Process python -ErrorAction SilentlyContinue | Select-Object Id, CPU, WorkingSet, StartTime | Format-Table -AutoSize
