#!/usr/bin/env python3
""" Spit out the keycode of what we're typing"""
import curses
import time
import os

WIN = curses.initscr()
WIN.keypad(0)
WIN.nodelay(True)
WIN.scrollok(1)
curses.cbreak()
curses.noecho()

WIN.addstr("Start typing... Ctrl+C to exit out (KEYCODE: -1)\n")
WIN.refresh()

while True:
    try:
        KEY = WIN.getch()
        if KEY != -1:
            WIN.addstr("KEYCODE: "+str(KEY).rstrip()+"\n")
            WIN.refresh()
        time.sleep(0.01)
    except KeyboardInterrupt:
        curses.endwin()
        print("KeyboardInterrupt: "+str(KEY))
        exit(0)
    except Exception as err:
        print("Exception: "+str(KEY))
        print(err)
        print(
            "Trying to crash out gracefully... Run 'stty sane' if your terminal is broken.")
        curses.endwin()
        os.system("stty sane")
        exit(1)
