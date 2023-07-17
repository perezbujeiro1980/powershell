$rutas = @(
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\controlLenox2",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\RYPESADAS_PRO",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\BOE43AUDIT",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\BOE43",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\BioStar",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\COMPROBANTES",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\DW_RAYMOS",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\ISOKEYNET",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\Ebudgetv2",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\indigo_install",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\Piryp",
    "\\ryap025bue\d$\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\STG_RAYMOS"
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
