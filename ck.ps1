for ($i = 0; ; $i++) {
    Write-Output "$i"
    Start-Process .\Generator.exe -RedirectStandardOutput .\in -NoNewWindow -Wait
    Start-Process .\Brute -RedirectStandardInput .\in -RedirectStandardOutput .\out1 -NoNewWindow -Wait
    Start-Process .\Error -RedirectStandardInput .\in -RedirectStandardOutput .\out2 -NoNewWindow -Wait
    if ((Get-FileHash .\out1).Hash -ne (Get-FileHash .\out2).Hash) {
        Compare-Object (Get-Content out1) (Get-Content out2)
        break
    }
}