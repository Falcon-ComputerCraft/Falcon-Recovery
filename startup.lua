print("Welcome to Falcon Recovery.")
print("Booting CraftOS in")
for Time = 1, 6 do
    print(6-Time)
    sleep(1)
end
print("Booting ...")
shell.execute("shell")
print("Shutting down.")
sleep(1)
os.shutdown()
