# -*- coding: utf-8 -*-

"""
Module implementing HomeWindow.
"""
import os
from PyQt4.QtGui import *
from PyQt4.QtCore import *
from PyQt4.QtMaemo5 import QMaemo5InformationBox
from Ui_homewindow import Ui_HomeWindow
from aboutwindow import AboutWindow

class HomeWindow(QMainWindow, Ui_HomeWindow):
    """
    Class documentation goes here.
    """
    def __init__(self, parent = None):
        """
        Constructor
        """
        QMainWindow.__init__(self, parent)
        self.setupUi(self)
        #self.restoreSettings()
        self.setAttribute(Qt.WA_Maemo5StackedWindow) 
        self.connect(QApplication.desktop(), SIGNAL("resized(int)"), self.orientationChanged)
        self.orientationChanged()
        for button in (self.myAccountButton, self.mostRecentButton):
            button.setStyleSheet("border: 2px solid rgb(120, 120, 120); border-radius: 6px;") 
            self.connect(button,  SIGNAL("pressed()"), self.changeButtonStyleSheet)
            self.connect(button,  SIGNAL("released()"), self.changeButtonStyleSheet)
        self.show()
        
    def changeButtonStyleSheet(self):
        """
        Setting the QToolButton style sheets in the conventional 
        way caused trouble with the Maemo specific widgets, so 
        I'm using a signal instead.
        """
        button = self.sender()
        if button.isDown():
            button.setStyleSheet("border: 2px solid rgb(120, 120, 120); border-radius: 6px; background-color: rgb(120, 120, 120)")
        else:
            button.setStyleSheet("border: 2px solid rgb(120, 120, 120); border-radius: 6px;") 
            
    def closeEvent(self, event):
        """
        Saves the application settings.
        """
        try:
            settings = QSettings("Chi Hoang", "Performance Efficient Optimization Tune-Up Utilities")
            autoOrientation = QVariant(GeneralSettings.autoOrientation)
            settings.setValue("autoOrientation", autoOrientation)
        except Exception, e:
            pass

    def setAutoDisplayOrientation(self):
        """
        Sets the display orientation of the application.
        """
        self.setAttribute(Qt.WA_Maemo5AutoOrientation, GeneralSettings.autoOrientation)

    def orientationChanged(self):
        """
        Re-orders the window's widgets.
        """
        screenGeometry = QApplication.desktop().screenGeometry()
        if screenGeometry.height() > screenGeometry.width():
            self.resize(480, 800)
            self.myAccountButton.setGeometry(QRect(80, 150, 120, 120))
            self.myAccountLabel.setGeometry(QRect(76, 278, 127, 26))
            self.mostRecentButton.setGeometry(QRect(280, 150, 120, 120))
            self.mostRecentLabel.setGeometry(QRect(274, 278, 132, 26))

        else:
            self.resize(800, 480)
            self.myAccountButton.setGeometry(QRect(57, 123, 120, 120))
            self.myAccountLabel.setGeometry(QRect(53, 250, 127, 26))
            self.mostRecentButton.setGeometry(QRect(243, 123, 120, 120))
            self.mostRecentLabel.setGeometry(QRect(239, 250, 132, 26))

              
    @pyqtSignature("")
    def on_myAccountButton_clicked(self):
        """
        Creates a MyAccounrtWindow
        """
        #QMaemo5InformationBox.information(self, "You are not signed in to YouTube")
        #myAccountWindow = myaccountwindow.MyAccountWindow(self)
        os.system("sudo /opt/n900-tune-up/deinstall.sh");

    @pyqtSignature("")
    def on_mostRecentButton_clicked(self):
        """
        Creates a mostRecentrtWindow
        """
        #QMaemo5InformationBox.information(self, "You are not signed in to YouTube")
        #myAccountWindow = myaccountwindow.MyAccountWindow(self)
        os.system("sudo /opt/n900-tune-up/install.sh");
  
    @pyqtSignature("")
    def on_actionAbout_triggered(self):
        """
        Raises an AboutWindow
        """
        aboutWindow = AboutWindow(self)

