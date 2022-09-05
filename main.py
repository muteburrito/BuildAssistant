# This Python file uses the following encoding: utf-8
import sys
import os
import time
import datetime
import psutil
from pathlib import Path

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        # QTimer for printing time every 1 second
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.runningTime())
        self.timer.timeout.connect(lambda: self.setTime())
        self.timer.timeout.connect(lambda: self.ramUsed())
        self.timer.start(1000)

    # Signal set name
    #setData = Signal(str)

    # Signal for printing time
    printTime = Signal(str)

    # Signal for RAM usage
    ramUsage = Signal(str)

    # Signal for uptime
    upTime = Signal(str)

    # Function for displaying up time
    def runningTime(self):
        process = psutil.Process(os.getpid())
        start_time = process.create_time()
        time_run = time.strftime("%m%d%y%I%M%S", time.localtime(start_time))

        # Current Time
        now = datetime.datetime.now()
        formatDateTime = now.strftime("%m%d%y%I%M%S")

        timerunning = int(formatDateTime) - int(time_run)

        t_running = timerunning
        self.upTime.emit(f"UpTime of the app is : {t_running} seconds")

    # Function for displaying Ram Usage (WIP)
    def ramUsed(self):
        #percent = psutil.Process(os.getpid()).memory_info().rss/1024/1024
        psutil.virtual_memory()
        dict(psutil.virtual_memory()._asdict())
        percent = psutil.virtual_memory().available * 100 / psutil.virtual_memory().total
        psutil.virtual_memory().percent
        print(percent)
        self.ramUsage.emit(f"RAM used is : {percent}")

    # Function for displaying time (setTime)
    def setTime(self):
        now = datetime.datetime.now()
        formatDateTime = now.strftime("%I:%M:%S")
        #print(formatDateTime) for debug only
        self.printTime.emit(formatDateTime)

    # Function set name to label
    #@Slot(str)
    #def printData(self, platform):
    #    self.setData.emit(f"Platform: {platform}\nTarget:\nBuild Type:")


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Setting up connection
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # Load QML file
    qml_file = Path(__file__).resolve().parent / "qml/main.qml"

    engine.load(str(qml_file))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
