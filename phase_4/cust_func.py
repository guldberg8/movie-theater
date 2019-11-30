import sys, pymysql, registration_classes, UI, functionality_classes
from PyQt5.QtCore import Qt, QAbstractTableModel, QVariant
from PyQt5.QtWidgets import (
    QApplication,
    QWidget,
    QLabel,
    QPushButton,
    QHBoxLayout,
    QVBoxLayout,
    QListView,
    QLabel,
    QAbstractItemView,
    QMessageBox,
    QLineEdit,
    QAction,
    QSplitter,
    QTableWidget,
    QTableWidgetItem,
    QTableView, QDialog, qApp, QGroupBox, QFormLayout, QComboBox, QDialogButtonBox)
from PyQt5.QtGui import (
    QStandardItemModel,
    QStandardItem)


class explore(QDialog):
    def __init__(self):
        super(explore, self).__init__()
        self.setWindowTitle("Explore Movie")

        self.movieName = QComboBox()
        self.movieName.addItems([])

        self.companyName = QComboBox()
        self.companyName.addItems([])

        self.state = QComboBox()
        self.state.addItems([])

        self.city = QLineEdit()

        self.moviePlayStart = QLineEdit() #change to calendar select
        self.moviePlayEnd = QLineEdit() #change to calendar selcet

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()
        row4 = QHBoxLayout()
        row5 = QHBoxLayout()
        row6 = QHBoxLayout()

        row1.addWidget(QLabel('Movie Name'))
        row1.addWidget(self.movieName)
        row1.addWidget(QLabel('Company Name'))
        row1.addWidget(self.companyName)

        row2.addWidget(QLabel('City'))
        row2.addWidget(self.city)
        row2.addWidget(QLabel('State'))
        row2.addWidget(self.state)

        row3.addWidget(QLabel('Movie Play Date'))
        row3.addWidget(self.moviePlayStart)
        row3.addWidget(QLabel('-'))
        row3.addWidget(self.moviePlayEnd)

        self.b1 = QPushButton("Filter")
        row4.addWidget(self.b1)


        #chart here

        self.b2 = QPushButton("Back")
        row6.addWidget(self.b2)

        row6.addWidget(QLabel('Card Number'))
        self.cardNumber = QComboBox()
        self.cardNumber.addItems([])
        row6.addWidget(self.cardNumber)

        self.b3 = QPushButton("View")
        row6.addWidget(self.b3)


        self.table = QTableView()

        vbox.addItem(row1)
        self.setLayout(vbox)

class vist_history(QDialog):
    def __init__(self):
        super(vist_history, self).__init__()
        self.setWindowTitle("Visit History")

        self.companyName = QComboBox()
        self.companyName.addItems([])

        self.visitDateStart = QLineEdit() #change to calendar select
        self.visitDateEnd = QLineEdit() #change to calendar selcet

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()
        row4 = QHBoxLayout()

        row1.addWidget(QLabel('Company Name'))
        row1.addWidget(self.companyName)

        row1.addWidget(QLabel('Visit Date'))
        row1.addWidget(self.visitDateStart)
        row1.addWidget(QLabel('-'))
        row1.addWidget(self.visitDateEnd)

        row2.addWidget(QLabel('City'))
        row2.addWidget(self.city)
        row2.addWidget(QLabel('State'))
        row2.addWidget(self.state)

        self.b1 = QPushButton("Filter")
        row3.addWidget(self.b1)

        #add chart here row 3

        self.b2 = QPushButton("Back")
        row4.addWidget(self.b2)


class explore_theater(QDialog):
    def __init__(self):
        super(explore_theater, self).__init__()
        self.setWindowTitle("Explore Theater")

        self.theaterName = QComboBox()
        self.theaterName.addItems([])

        self.companyName = QComboBox()
        self.companyName.addItems([])

        self.city = QLineEdit()

        self.state = QComboBox()
        self.state.addItems([])

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()
        row4 = QHBoxLayout()
        row5 = QHBoxLayout()

        row1.addWidget(QLabel('Theater Name'))
        row1.addWidget(self.theaterName)
        row1.addWidget(QLabel('Company Name'))
        row1.addWidget(self.companyName)

        self.b1 = QPushButton("Filter")
        row3.addWidget(self.b1)

        #insert chart here row 4

        self.b2 = QPushButton("Back")
        row5.addWidget(self.b2)

        self.visitDate = QLineEdit() #change to calendar select
        row5.addWidget(self.visitDate)

        self.logButton = QPushButton("Log Visit")
        row5.addWidget(self.logButton)

class view_history(QDialog):
    def __init__(self):
        super(view_history, self).__init__()
        self.setWindowTitle("View History")

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()

        #chart here row 1

        self.b2 = QPushButton("Back")
        row2.addWidget(self.b2)
