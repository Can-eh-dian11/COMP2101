function Get-HardwareInformation(){
    Get-CimInstance win32_computersystem | Format-List Description
}

function Get-OperatingSystemInformation(){
    Get-CimInstance win32_operatingsystem | Format-List @{Name="Name";Expression={$_.Caption}}, Version
}

function Get-ProcessorInformation(){
    Get-CimInstance win32_processor | Format-List Name, Description, @{Name="CurrentClockSpeed (GHz)";Expression={$_.CurrentClockSpeed / 1000}},
                                                                     @{Name="MaxClockSpeed (GHz)";Expression={$_.MaxClockSpeed / 1000}},
                                                                     NumberOfCores,
                                                                     @{Name="L1CacheSize";Expression={if($_.L1CacheSize -eq $null){"data unavailable"}else{$_.L1CacheSize}}},
                                                                     @{Name="L2CacheSize";Expression={if($_.L2CacheSize -eq $null){"data unavailable"}else{$_.L2CacheSize}}},
                                                                     @{Name="L3CacheSize";Expression={if($_.L3CacheSize -eq $null){"data unavailable"}else{$_.L3CacheSize}}}
}

function Get-MemoryInformation(){
    Get-CimInstance win32_physicalmemory | Format-Table -AutoSize Manufacturer, Description, BankLabel, @{Label="Capacity (GB)"; Expression={$_.Capacity / 1GB}}
}

function Get-DiskInformation(){
    $diskdrives = Get-CIMInstance CIM_diskdrive

    foreach ($disk in $diskdrives) {
        $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
        foreach ($partition in $partitions) {
            $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
            foreach ($logicaldisk in $logicaldisks) {
                new-object -typename psobject -property @{Manufacturer=$disk.Manufacturer
                                                        Location=$partition.DeviceId
                                                        Drive=$logicaldisk.DeviceId
                                                        "Size(GB)"=$logicaldisk.Size / 1gb -as [int]
                                                        "Free Space(GB)"=$logicaldisk.FreeSpace / 1gb -as [int]
                                                        "Percentage Free"=[math]::Round(($logicaldisk.FreeSpace / $logicaldisk.Size) * 100)} | Format-Table Drive,
                                                         Manufacturer, Location, "Size(GB)", "Free Space(GB)", "Percentage Free"
            }
        }
    }
}

function Get-NetworkInformation(){
    ipconfiguration.ps1 | Format-List
}

function Get-GraphicsInformation(){
    Get-CimInstance win32_videocontroller | Format-List @{Name="Vendor";Expression={$_.AdapterCompatibility}}, Description, 
    @{Name="Resolution";Expression={"$($_.CurrentHorizontalResolution) x $($_.CurrentVerticalResolution)"}}
}

function welcome{
    write-output "Welcome to planet $env:computername Overlord $env:username"
    $now = get-date -format 'HH:MM tt on dddd'
    write-output "It is $now."
}

function get-cpuinfo{
    Get-CimInstance cim_processor | Format-List Manufacturer, Name, NumberOfCores, CurrentClockSpeed, MaxClockSpeed
}

function get-mydisks{
    Get-Disk | Format-Table -AutoSize Manufacturer, Model, SerialNumber, FirmwareVersion, Size
}