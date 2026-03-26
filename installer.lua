local InstallURL = "https://raw.githubusercontent.com/Falcon-ComputerCraft/Falcon-Recovery/refs/heads/main/startup.lua"

print("Would you like to install Falcon Recovery to your current disk?")
print("Y/N")

local choice = read():lower()
if choice ~= "y" then
    print("Bye bye!")
    return
end

-- Find disk drive
local disk_drive = peripheral.find("drive")
while not disk_drive do
    print("Disk drive not found! Please attach a disk drive.")
    sleep(1)
    disk_drive = peripheral.find("drive")
end
print("Found disk drive!")

-- Wait for disk
while not disk_drive.isDiskPresent() do
    print("Please insert a disk to continue with the installation.")
    sleep(1)
end
print("Disk found inside disk drive!")

-- Download file
local request = http.get(InstallURL)
if not request then
    print("REQUEST FAILED - Check internet or HTTP config.")
    return
end

local contents = request.readAll()
request.close()

-- Write file
local file = fs.open("/disk/startup.lua", "w")
if not file then
    print("FILE OPEN FAILED")
    return
end

file.write(contents)
file.close()

-- Label disk
disk_drive.setDiskLabel("Falcon Recovery disk")
disk_drive.ejectDisk()

print("Done with installation! We have thrown your disk at you.")
