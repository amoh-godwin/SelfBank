# -*- coding: utf-8 -*-
"""
    Thank you Heavenly Father for your love and affection
"""
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
import sys; from time import time

class SelfBank(QObject):
    
    def __init__(self):
        QObject.__init__(self)
        
    history = pyqtSignal(float, arguments=["history_check"])
    total = pyqtSignal(float, arguments=["totally"])
    payed = pyqtSignal(str, arguments=["pay"])
    
    @pyqtSlot(float)
    def history_check(self, day):
        with open('history.txt', encoding='utf-8', mode='r') as hist_file:
            lines = hist_file.read()
            splits = lines.split('\n')
            length = len(splits) - 2
        last_checked = splits[length]
        prev_time = float(last_checked)
        curr_time = time()
        diff_seconds = curr_time - prev_time
        print(diff_seconds)
        self.history.emit(diff_seconds)

    @pyqtSlot(float)
    def totally(self, day):
        with open('sum.txt', encoding='utf-8', mode='r') as total_file:
            lines = total_file.read()
            splits = lines.split('\n')
            print(splits)
            total = float(splits[0])
            print(total)
        self.total.emit(total)

    @pyqtSlot(str)
    def pay(self, total):
        with open('sum.txt', encoding='utf-8', mode='w') as total_file:
            total_file.write(total + '\n')
        with open('history.txt', encoding='utf-8', mode='a') as hist_file:
            hist_file.write(str(time()) + '\n')
    
app = QGuiApplication(sys.argv)
Bank = SelfBank()
engine = QQmlApplicationEngine()
engine.rootContext().setContextProperty('bank', Bank)
engine.load('ui.qml')
engine.quit.connect(app.quit)
sys.exit(app.exec_())