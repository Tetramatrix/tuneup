# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'homewindow.ui'
#
# Created: Thu Nov  4 21:39:09 2010
#      by: PyQt4 UI code generator 4.7.2
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

class Ui_HomeWindow(object):
    def setupUi(self, HomeWindow):
        HomeWindow.setObjectName("HomeWindow")
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(HomeWindow.sizePolicy().hasHeightForWidth())
        HomeWindow.setSizePolicy(sizePolicy)
        self.centralwidget = QtGui.QWidget(HomeWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.myAccountButton = QtGui.QToolButton(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.myAccountButton.sizePolicy().hasHeightForWidth())
        self.myAccountButton.setSizePolicy(sizePolicy)
        self.myAccountButton.setText("")
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap("/opt/n900-tune-up/uninstall.png"))
        self.myAccountButton.setIcon(icon)
        self.myAccountButton.setIconSize(QtCore.QSize(105, 105))
        self.myAccountButton.setObjectName("myAccountButton")
        self.searchLabel = QtGui.QLabel(self.centralwidget)
        self.myAccountLabel = QtGui.QLabel(self.centralwidget)
        font = QtGui.QFont()
        font.setPointSize(16)
        self.myAccountLabel.setFont(font)
        self.myAccountLabel.setAlignment(QtCore.Qt.AlignCenter)
        self.myAccountLabel.setObjectName("myAccountLabel")

        self.mostRecentButton = QtGui.QToolButton(self.centralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.mostRecentButton.sizePolicy().hasHeightForWidth())
        self.mostRecentButton.setSizePolicy(sizePolicy)
        self.mostRecentButton.setText("")
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap("/opt/n900-tune-up/install.png"))
        self.mostRecentButton.setIcon(icon1)
        self.mostRecentButton.setIconSize(QtCore.QSize(105, 105))
        self.mostRecentButton.setObjectName("mostRecentButton")
        self.mostRecentLabel = QtGui.QLabel(self.centralwidget)
        font = QtGui.QFont()
        font.setPointSize(16)
        self.mostRecentLabel.setFont(font)
        self.mostRecentLabel.setAlignment(QtCore.Qt.AlignCenter)
        self.mostRecentLabel.setObjectName("mostRecentLabel") 

        HomeWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtGui.QMenuBar(HomeWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 23))
        self.menubar.setObjectName("menubar")
        self.homeMenu = QtGui.QMenu(self.menubar)
        self.homeMenu.setObjectName("homeMenu")
        HomeWindow.setMenuBar(self.menubar)
        self.actionAbout = QtGui.QAction(HomeWindow)
        self.actionAbout.setObjectName("actionAbout")
        self.homeMenu.addAction(self.actionAbout)
        self.menubar.addAction(self.homeMenu.menuAction())

        self.retranslateUi(HomeWindow)
        QtCore.QMetaObject.connectSlotsByName(HomeWindow)

    def retranslateUi(self, HomeWindow):
        HomeWindow.setWindowTitle(QtGui.QApplication.translate("HomeWindow", "Tune-Up", None, QtGui.QApplication.UnicodeUTF8))
        self.homeMenu.setTitle(QtGui.QApplication.translate("HomeWindow", "Menu", None, QtGui.QApplication.UnicodeUTF8))
        self.actionAbout.setText(QtGui.QApplication.translate("HomeWindow", "About", None, QtGui.QApplication.UnicodeUTF8))
        self.myAccountLabel.setText(QtGui.QApplication.translate("HomeWindow", "Uninstall", None, QtGui.QApplication.UnicodeUTF8))
        self.mostRecentLabel.setText(QtGui.QApplication.translate("HomeWindow", "Install", None, QtGui.QApplication.UnicodeUTF8))

