from tkinter import HORIZONTAL, Button, Tk, ttk
import time


def start():
    tasks = 10
    x = 0
    while(x < tasks):
        time.sleep(1)
        bar['value'] += 10
        x += 1
        window.update_idletasks()


window = Tk()
bar = ttk.Progressbar(window, orient=HORIZONTAL, length=300)
bar.pack(pady=10)

button = Button(window, text="Add", command=start).pack()
window.mainloop()
