command = ""
started = False
stopped = True
help_msg = '''
> start - to start the car
> stop - to stop the car
> quit - to exit
'''
while True:
    command = input("> ").lower()
    if command == "start":
        if started:
            print("Car is already started!")
        else:
            started = True
            stopped = False
            print("Car started... Ready to go!")
    elif command == "stop":
        if not started:
            print("Car is already stopped!")
        else:
            started = False
            print("Car stopped.")
    elif command == "help":
        print(help_msg)
    elif command == "quit":
        break
    else:
        print("I don't understand that...")