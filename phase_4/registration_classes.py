import sys, pymysql, UI
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


class user_register_popup(QDialog):
    def __init__(self, nav_screen):
        super(user_register_popup, self).__init__()
        self.setWindowTitle("User Registration")
        self.nav_screen = nav_screen
        self.user = QLineEdit()
        self.password = QLineEdit()

        form_group_box = QGroupBox("User Registration")
        layout = QFormLayout()
        layout.addRow(QLabel("Username:"), self.user)
        layout.addRow(QLabel("Password:"), self.password)
        register_button = QPushButton('Register')
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        register_button.clicked.connect(self.register_user)
        layout.addRow(back_button, register_button)
        form_group_box.setLayout(layout)

        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(QLabel('User Registration'))
        vbox_layout.addWidget(form_group_box)
        self.setLayout(vbox_layout)
        self.user.setFocus()

    def register_user(self):
        print('register')

    def back_clicked(self):
        self.close()
        self.nav_screen.exec_()

class cust_registration_popup(QDialog):
    def __init__(self, nav_screen):
        super(cust_registration_popup, self).__init__()
        self.setWindowTitle("Customer Registration")
        self.nav_screen = nav_screen
        self.user = QLineEdit()
        self.password = QLineEdit()

        form_group_box = QGroupBox("Customer Registration")
        layout = QFormLayout()
        layout.addRow(QLabel("Username:"), self.user)
        layout.addRow(QLabel("Password:"), self.password)
        register_button = QPushButton('Register')
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        register_button.clicked.connect(self.register_user)
        layout.addRow(back_button, register_button)
        form_group_box.setLayout(layout)

        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(QLabel('Customer Registration'))
        vbox_layout.addWidget(form_group_box)
        self.setLayout(vbox_layout)
        self.user.setFocus()

    def register_user(self):
        print('register')

    def back_clicked(self):
        self.close()
        self.nav_screen.exec_()

class man_registration_popup(QDialog):
    def __init__(self, nav_screen):
        super(man_registration_popup, self).__init__()
        self.setWindowTitle("Manager Registration")
        self.nav_screen = nav_screen
        self.user = QLineEdit()
        self.password = QLineEdit()

        form_group_box = QGroupBox("Manager Registration")
        layout = QFormLayout()
        layout.addRow(QLabel("Username:"), self.user)
        layout.addRow(QLabel("Password:"), self.password)
        register_button = QPushButton('Register')
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        register_button.clicked.connect(self.register_user)
        layout.addRow(back_button, register_button)
        form_group_box.setLayout(layout)

        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(QLabel('Manager Registration'))
        vbox_layout.addWidget(form_group_box)
        self.setLayout(vbox_layout)
        self.user.setFocus()

    def register_user(self):
        print('register')

    def back_clicked(self):
        self.close()
        self.nav_screen.exec_()

class man_cust_registration_popup(QDialog):
    def __init__(self, nav_screen):
        super(man_cust_registration_popup, self).__init__()
        self.setWindowTitle("Manager-Customer Registration")
        self.nav_screen = nav_screen
        self.user = QLineEdit()
        self.password = QLineEdit()

        form_group_box = QGroupBox("Manager-Customer Registration")
        layout = QFormLayout()
        layout.addRow(QLabel("Username:"), self.user)
        layout.addRow(QLabel("Password:"), self.password)
        register_button = QPushButton('Register')
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        register_button.clicked.connect(self.register_user)
        layout.addRow(back_button, register_button)
        form_group_box.setLayout(layout)

        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(QLabel('Manager-Customer Registration'))
        vbox_layout.addWidget(form_group_box)
        self.setLayout(vbox_layout)
        self.user.setFocus()

    def register_user(self):
        print('register')

    def back_clicked(self):
        self.close()
        self.nav_screen.exec_()
