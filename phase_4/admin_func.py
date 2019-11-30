import sys, pymysql, registration_classes, UI, functionality_classes
from datetime import date
from PyQt5.QtCore import Qt, QAbstractTableModel, QVariant
from PyQt5.QtWidgets import (
    QApplication,
    QWidget,
    QLabel,
    QPushButton,
    QHBoxLayout,
    QVBoxLayout,
    QRadioButton,
    QListView,
    QLabel,
    QAbstractItemView,
    QMessageBox,
    QLineEdit,
    QAction,
    QSplitter,
    QTableWidget,
    QTableWidgetItem,
    QCalendarWidget,
    QTableView, QDialog, qApp, QGroupBox, QFormLayout, QComboBox, QDialogButtonBox)
from PyQt5.QtGui import (
    QStandardItemModel,
    QStandardItem)

class manage_user(QDialog):
    def __init__(self):
        super(manage_user, self).__init__()
        self.setWindowTitle("Manage User")
        self.username = QLineEdit()
        self.status = QComboBox()
        self.b1 = QPushButton("Filter")
        self.b2 = QPushButton("Approve")
        self.b3 = QPushButton("Decline")
        self.b4 = QPushButton("Back")

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()
        row4 = QHBoxLayout()

        row1.addWidget(QLabel('Username'))
        row1.addWidget(self.username)
        row1.addWidget(QLabel('Status'))
        row1.addWidget(self.status)

        row2.addWidget(self.b1)
        row2.addWidget(self.b2)
        row2.addWidget(self.b3)

        #insert table here row 3

        row4.addWidget(self.b4)

        self.table = QTableView()

        vbox.addItem(row1)
        vbox.addItem(row2)
        vbox.addItem(row3)
        vbox.addItem(row4)
        self.setLayout(vbox)

class manage_comp(QDialog):
    def __init__(self):
        super(manage_comp, self).__init__()
        self.setWindowTitle("Manage Company")

        self.name = QComboBox()
        self.name.addItems([])
        self.minCities = QLineEdit()
        self.maxCities = QLineEdit()
        self.minTheaters  = QLineEdit()
        self.maxTheaters  = QLineEdit()
        self.minEmployees = QLineEdit()
        self.maxEmployees = QLineEdit()
        self.b1 = QPushButton("Filter")
        self.b2 = QPushButton("Create Theater")
        self.b3 = QPushButton("Detail")
        self.b4 = QPushButton("Back")

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()
        row4 = QHBoxLayout()
        row5 = QHBoxLayout()

        row1.addWidget(QLabel('Name'))
        row1.addWidget(self.name)
        row1.addWidget(QLabel('# City Covered'))
        row1.addWidget(self.minCities)
        row1.addWidget(QLabel('--'))
        row1.addWidget(self.maxCities)

        row2.addWidget(QLabel('# Theaters'))
        row2.addWidget(self.minTheaters)
        row2.addWidget(QLabel('--'))
        row2.addWidget(self.maxTheaters)
        row2.addWidget(QLabel('# Employees'))
        row2.addWidget(self.minEmployees)
        row2.addWidget(QLabel('--'))
        row2.addWidget(self.maxEmployees)

        row3.addWidget(self.b1)
        row3.addWidget(self.b2)
        row3.addWidget(self.b3)

        #insert table here for row 4

        row5.addWidget(self.b4)

        vbox.addItem(row1)
        vbox.addItem(row2)
        vbox.addItem(row3)
        vbox.addItem(row4)
        vbox.addItem(row5)
        self.setLayout(vbox)

class create_theater(QDialog):
    def __init__(self):
        super(create_theater, self).__init__()
        self.setWindowTitle("Create Theater")

        self.name = QLineEdit()
        self.company = QComboBox()
        self.company.addItems([])
        self.streetAddress = QLineEdit()
        self.city = QLineEdit()
        self.state = QComboBox()
        self.state.addItems([])
        self.zipcode = QLineEdit()
        self.capacity = QLineEdit()
        self.manager = QComboBox()
        self.manager.addItems([])
        self.b1 = QPushButton("Back")
        self.b2 = QPushButton("Create")

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()
        row4 = QHBoxLayout()
        row5 = QHBoxLayout()

        row1.addWidget(QLabel('Name'))
        row1.addWidget(self.name)
        row1.addWidget(QLabel('Company'))
        row1.addWidget(self.company)
        row2.addWidget(QLabel('streetAddress'))
        row2.addWidget(self.streetAddress)
        row3.addWidget(QLabel('City'))
        row3.addWidget(self.city)
        row3.addWidget(QLabel('State'))
        row3.addWidget(self.state)
        row3.addWidget(QLabel('Zipcode'))
        row3.addWidget(self.zipcode)
        row4.addWidget(QLabel('Capacity'))
        row4.addWidget(self.capacity)
        row4.addWidget(QLabel('Manager'))
        row4.addWidget(self.manager)

        row5.addWidget(self.b1)
        row5.addWidget(self.b2)

        vbox.addItem(row1)
        vbox.addItem(row2)
        vbox.addItem(row3)
        vbox.addItem(row4)
        vbox.addItem(row5)
        self.setLayout(vbox)

class Company_detail(QDialog):
    def __init__(self):
        super(Company_detail, self).__init__()
        self.setWindowTitle("Company Detail")

        self.b1 = QPushButton("Back")

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()
        row4 = QHBoxLayout()
        row5 = QHBoxLayout()

        row1.addWidget(QLabel('Name'))
        #add company name row 1
        row2.addWidget(QLabel('Employees'))
        #add list of employees row 2
        row3.addWidget(QLabel('Theaters'))

        #insert table at row4

        row5.addWidget(self.b1)

        vbox.addItem(row1)
        vbox.addItem(row2)
        vbox.addItem(row3)
        vbox.addItem(row4)
        vbox.addItem(row5)
        self.setLayout(vbox)

class create_movie(QDialog):
    def __init__(self):
        super(create_movie, self).__init__()
        self.setWindowTitle("Create Movie")

        self.name = QLineEdit()
        self.duration = QLineEdit()
        self.releaseDate = QLineEdit() #change to calendar
        self.b1 = QPushButton("Back")
        self.b2 = QPushButton("Create")

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()

        row1.addWidget(QLabel('Name'))
        row1.addWidget(self.name)
        row1.addWidget(QLabel('Duration'))
        row1.addWidget(self.duration)
        row2.addWidget(QLabel('Release Date'))
        row2.addWidget(self.releaseDate)
        row3.addWidget(self.b1)
        row3.addWidget(self.b2)

        vbox.addItem(row1)
        vbox.addItem(row2)
        vbox.addItem(row3)
        self.setLayout(vbox)
