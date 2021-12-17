param ([switch]$System, [switch]$Disks, [switch]$Network)

if($System){
    "======================== Processor Information ========================"
    Get-ProcessorInformation
    "======================== Operating System Information ========================"
    Get-OperatingSystemInformation
    "======================== Memory Information ========================"
    Get-MemoryInformation
    "======================== Graphics Information ========================"
    Get-GraphicsInformation
}
elseif($Disks){
    "======================== Disk Information ========================"
    Get-DiskInformation
}
elseif($Network){
    "======================== Network Information ========================"
    Get-NetworkInformation
}
else{
    "======================== Hardware Information ========================"
    Get-HardwareInformation
    "======================== Processor Information ========================"
    Get-ProcessorInformation
    "======================== Operating System Information ========================"
    Get-OperatingSystemInformation
    "======================== Memory Information ========================"
    Get-MemoryInformation
    "======================== Graphics Information ========================"
    Get-GraphicsInformation
    "======================== Disk Information ========================"
    Get-DiskInformation
    "======================== Network Information ========================"
    Get-NetworkInformation
}