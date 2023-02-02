param ($file)

if ( ! $file) {
    Write-Host "You must specify at least one file to process"
    exit 1
}

$file | ForEach-Object -Process { 
    Write-Host "Data for $_" 
    $rows=Import-Csv $_ | Measure-Object | Select-Object @{n='RowsNumber';e={($_.Count)}}
    $approvedCharge=Get-Content $_ | ConvertFrom-Csv | Measure-Object "LatS" -Sum | Select-Object @{n='ApprovedChargeback';e={($_.Sum)}}
    $requestedCharge=Get-Content $_ | ConvertFrom-Csv | Measure-Object "LonS" -Sum | Select-Object @{n='RequestedChargeback';e={($_.Sum)}}
    Write-Host "Rows Number: $($rows.RowsNumber) `nApproved Chargeback: $($approvedCharge.ApprovedChargeback) `nRequested Chargeback: $($requestedCharge.RequestedChargeback)"
}
 
