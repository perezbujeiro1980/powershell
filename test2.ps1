$rutas = @(
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\",
    "\\\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\"
)

foreach ($ruta in $rutas) {
    $directorio = $ruta
    $archivos = Get-ChildItem -Path $directorio | Where-Object { ! $_.PsIsContainer } | Sort-Object LastWriteTime

    if ($archivos.Count -gt 1) {
        $archivoMasAntiguo = $archivos[0]
        Remove-Item -Path $archivoMasAntiguo.FullName -Force -Confirm:$false
        Write-Host "Se eliminó el archivo más antiguo: $($archivoMasAntiguo.Name)"
    } else {
        Write-Host "No se encontraron archivos o solo hay un archivo en el directorio."
    }
}
