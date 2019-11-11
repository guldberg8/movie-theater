# WHEN RUNNING, RUN AS: python UI.py <your_sql_password>
# ALSO NOTE: you have to have run create_team94.sql prior to running this file

import sys, pymysql
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


class DbLoginDialog(QDialog):
    def __init__(self):
        super(DbLoginDialog, self).__init__()
        self.setWindowTitle("Atlanta Movie Login")

        self.user = QLineEdit()
        self.password = QLineEdit()

        form_group_box = QGroupBox("Login Credentials")
        layout = QFormLayout()
        layout.addRow(QLabel("Username:"), self.user)
        layout.addRow(QLabel("Password:"), self.password)
        login_button = QPushButton('Login')
        register_button = QPushButton('Register')
        login_button.clicked.connect(self.validate_credentials)
        register_button.clicked.connect(self.register)
        layout.addRow(login_button, register_button)
        form_group_box.setLayout(layout)

        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(QLabel('Atlanta Movie Theater'))
        vbox_layout.addWidget(form_group_box)
        self.setLayout(vbox_layout)
        self.user.setFocus()

    def validate_credentials(self):
        cursor = connection.cursor()
        query = 'SELECT * FROM User WHERE username = %s;'
        cursor.execute(query, self.user.text())
        user_data = cursor.fetchone()
        entered_pass = self.password.text()
        if not user_data:
            inv_login = invalid_credentials()
            inv_login.exec_()
        else:
            if entered_pass == user_data['password']:
                functionality_delegator(self.user.text())

    def register(self):
        print('reg')

class invalid_credentials(QDialog):
    def __init__(self):
        super(invalid_credentials, self).__init__()
        self.setWindowTitle("Invalid Credentials")
        self.message = QLabel('Invalid username/password combination. Please try again.')
        self.back_button = QPushButton('Close')
        self.back_button.clicked.connect(self.back_button_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(self.back_button)
        self.setLayout(vbox)

    def back_button_clicked(self):
        self.close()
        login.password.clear()
        login.password.setFocus()
        login.exec()

# account_type needs to take into account the employee table
# right now, it just looks in the user table
def functionality_delegator(username):
    login.close()
    cursor = connection.cursor()
    query = 'SELECT * FROM User WHERE username = %s;'
    cursor.execute(query, username)
    user_data = cursor.fetchone()
    account_type = user_data['user_type']
    if 'Employee' in account_type:
        cursor = connection.cursor()
        query = 'SELECT * FROM Employee WHERE username = %s;'
        cursor.execute(query, username)
        emp_type = cursor.fetchone()['employeeType']
        if 'Customer' in account_type:
            account_type = f'{emp_type}, Customer'
        else:
            account_type = emp_type

    if account_type == 'Admin':
        admin_only_object = admin_only()
        admin_only_object.exec()
    elif 'Admin' in account_type and 'Customer' in account_type:
        admin_customer_object = admin_customer()
        admin_customer_object.exec()
    elif account_type == 'Manager':
        manager_only_object = manager_only()
        manager_only_object.exec()
    elif 'Manager' in account_type and 'Customer' in account_type:
        manager_customer_object = manager_customer()
        manager_customer_object.exec()
    elif account_type == 'Customer':
        customer_only_object = customer_only()
        customer_only_object.exec()
    elif account_type == 'User':
        user_only_object = user_only()
        user_only_object.exec()


class admin_only(QDialog):
    def __init__(self):
        super(admin_only, self).__init__()
        self.setWindowTitle("Admin-Only Functionality")
        self.message = QLabel('Admin-Only Functionality')
        self.back_button = QPushButton('Close')
        self.back_button.clicked.connect(self.back_button_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(self.back_button)
        self.setLayout(vbox)

    def back_button_clicked(self):
        self.close()
        login.password.clear()
        login.password.setFocus()
        login.exec()

class admin_customer(QDialog):
    def __init__(self):
        super(admin_only, self).__init__()
        self.setWindowTitle("Admin-Customer Functionality")
        self.message = QLabel('Admin-Customer Functionality')
        self.back_button = QPushButton('Close')
        self.back_button.clicked.connect(self.back_button_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(self.back_button)
        self.setLayout(vbox)

    def back_button_clicked(self):
        self.close()
        login.password.clear()
        login.password.setFocus()
        login.exec()

class manager_only(QDialog):
    def __init__(self):
        super(manager_only, self).__init__()
        self.setWindowTitle("Manager-Only Functionality")
        self.message = QLabel('Manager-Only Functionality')
        self.back_button = QPushButton('Close')
        self.back_button.clicked.connect(self.back_button_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(self.back_button)
        self.setLayout(vbox)

    def back_button_clicked(self):
        self.close()
        login.password.clear()
        login.password.setFocus()
        login.exec()

class manager_customer(QDialog):
    def __init__(self):
        super(manager_customer, self).__init__()
        self.setWindowTitle("Manager-Customer Functionality")
        self.message = QLabel('Manager-Customer Functionality')
        self.back_button = QPushButton('Close')
        self.back_button.clicked.connect(self.back_button_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(self.back_button)
        self.setLayout(vbox)

    def back_button_clicked(self):
        self.close()
        login.password.clear()
        login.password.setFocus()
        login.exec()

class customer_only(QDialog):
    def __init__(self):
        super(customer_only, self).__init__()
        self.setWindowTitle("Customer Functionality")
        self.message = QLabel('Customer Functionality')
        self.back_button = QPushButton('Close')
        self.back_button.clicked.connect(self.back_button_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(self.back_button)
        self.setLayout(vbox)

    def back_button_clicked(self):
        self.close()
        login.password.clear()
        login.password.setFocus()
        login.exec()

class user_only(QDialog):
    def __init__(self):
        super(user_only, self).__init__()
        self.setWindowTitle("User Functionality")
        self.message = QLabel('User Functionality')
        self.back_button = QPushButton('Close')
        self.back_button.clicked.connect(self.back_button_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(self.back_button)
        self.setLayout(vbox)

    def back_button_clicked(self):
        self.close()
        login.password.clear()
        login.password.setFocus()
        login.exec()

# class NavigationWindow(QDialog):
#     def __init__(self):
#         super(NavigationWindow, self).__init__()
#         self.setWindowTitle("Navigation Window")
#         cursor = connection.cursor()
#         cursor.execute('show tables')
#         vbox_layout = QVBoxLayout()
#
#         self.button1 = QPushButton('Question 1')
#         self.button1.clicked.connect(self.q1)
#         vbox_layout.addWidget(self.button1)
#
#         self.setLayout(vbox_layout)
#
#     def q1(self):
#         self.close()
#         Question1().exec()


if __name__=='__main__':
    app = QApplication(sys.argv)
    args = sys.argv

    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password=args[1],
                                 db='Team94',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)


    login = DbLoginDialog()
    login.show()
    sys.exit(app.exec_())


