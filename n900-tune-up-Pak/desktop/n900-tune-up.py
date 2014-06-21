#!/usr/bin/env python

import sys
import homewindow

from PyQt4.QtGui import QApplication

app = QApplication(sys.argv)
app.setOrganizationName("Chi Hoang")
app.setOrganizationDomain("www.chihoang.de")
app.setApplicationName("N900-Tune-Up")
cuteTube = homewindow.HomeWindow()
app.exec_()
