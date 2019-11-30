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

class manage_user(QDialog):
    def __init__(self):
        super(manage_user, self).__init__()
        self.setWindowTitle("Manage User")
        self.username = QLineEdit()
        self.status = QLineEdit()

        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row1.addWidget(QLabel('Username:'))
        row1.addWidget(self.username)
        row1.addWidget(QLabel('Status:'))
        row1.addWidget(self.status)

        self.table = QTableView()

        vbox.addItem(row1)
        self.setLayout(vbox)
        
        #username box
        #status of all, pending, declined, approved
        #filter 
        # appprove on Decline buttons
        # table of username, credit card count, user type, and status

class manage_comp(QDialog):
    def __init__(self):
        super(manage_comp, self).__init__()
        self.setWindowTitle("Manage Company")
          vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row1.addWidget(QLabel('Username:'))
        row1.addWidget(self.username)
        row1.addWidget(QLabel('# City Covered'))
        row1.addWidget(self.status)

        #name -- dropdown of theater (names individually, and -ALL-)
        # table of sortable columns 
        # City Covered
        # # Theaters
        # # Employees
        # table of Name, #CityCovered, #Theaters, #Employee 

      
class create_theater(QDialog):
    def __init__(self):
        super(create_theater, self).__init__()
        self.setWindowTitle("Create Theater")

class Company_detail(QDialog):
    def __init__(self):
        super(company_detail, self).__init__()
        self.setWindowTitle("Company Detail")

class create_movie(QDialog):
    def __init__(self):
        super(create_movie, self).__init__()
        self.setWindowTitle("Create Movie")
