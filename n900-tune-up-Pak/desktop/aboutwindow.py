# -*- coding: utf-8 -*-

"""
Module implementing the AboutWindow and its child windows.
"""
from __future__ import with_statement
from PyQt4.QtCore import *
from PyQt4.QtGui import QMainWindow, QTextEdit, QProgressBar
from Ui_aboutwindow import Ui_AboutWindow
from PyQt4.QtMaemo5 import QMaemo5InformationBox

class AboutWindow(QMainWindow, Ui_AboutWindow):
    """
    This window displays the manual and log, 
    along with other options.
    """
    def __init__(self, parent):
        """
        Constructor
        """
        QMainWindow.__init__(self, parent)
        self.setupUi(self)
        self.setAttribute(Qt.WA_Maemo5StackedWindow)
        self.show()
        
    @pyqtSignature("")
    def on_actionManual_triggered(self):
        """
        Raises the ManualWindow displaying the Tune-Up manual.
        """
        manualWindow = WebViewWindow(self, "Tune-Up Manual", "file:///opt/n900-tune-up/manual.html")
        
    @pyqtSignature("")
    def on_actionReportBug_triggered(self):
        """
        Raises the ReportBugWindow displaying the bugtracker web page.
        """
        reportBugWindow = WebViewWindow(self, "Report Bug", "http://n900-tune-up.sourceforge.net")
  
