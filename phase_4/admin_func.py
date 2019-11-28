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

class manage_comp(QDialog):
    def __init__(self):
        super(manage_comp, self).__init__()
        self.setWindowTitle("Manage Company")

class create_movie(QDialog):
    def __init__(self):
        super(create_movie, self).__init__()
        self.setWindowTitle("Create Movie")