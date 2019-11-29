# WHEN RUNNING, RUN AS: python UI.py <your_sql_password>
# ALSO NOTE: you have to have run create_team94.sql prior to running this file

import sys, pymysql, registration_classes, functionality_classes
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

args = sys.argv
try:
    password = args[1]
except:
    password = ''

connection = pymysql.connect(host='localhost',
                             user='root',
                             password=password,
                             db='Team94',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
test = True

if test:
    test_user = 'cool_class4400'
    test_pass = '333333333'
else:
    test_user = ''
    test_pass = ''

class DbLoginDialog(QDialog):
    def __init__(self):
        super(DbLoginDialog, self).__init__()
        self.setWindowTitle("Atlanta Movie Login")

        self.user = QLineEdit(test_user)
        self.password = QLineEdit(test_pass)
        self.password.setEchoMode(QLineEdit.Password)

        form_group_box = QGroupBox("Login Credentials")
        layout = QFormLayout()
        layout.addRow(QLabel("Username:"), self.user)
        layout.addRow(QLabel("Password:"), self.password)
        login_button = QPushButton('Login')
        register_button = QPushButton('Register')
        login_button.clicked.connect(self.validate_credentials)
        register_button.clicked.connect(self.check_register)
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
            else:
                inv = invalid_credentials()
                inv.exec_()

    def check_register(self):
        cursor = connection.cursor()
        query = 'SELECT * FROM User WHERE username = %s;'
        cursor.execute(query, self.user.text())
        user_data = cursor.fetchone()
        # If username already in database
        self.register()

    def user_exists(self):
        user_exists = existing_user_popup(self.user.text())
        user_exists.exec_()

    def register(self):
        register = register_navigation()
        register.exec_()
        login.close()

class register_navigation(QDialog):
    def __init__(self):
        super(register_navigation, self).__init__()
        self.setWindowTitle("Registration Navigation")
        vbox_layout = QVBoxLayout()

        user_button = QPushButton('User Only')
        user_button.clicked.connect(self.user_only)
        customer_button = QPushButton('Customer Only')
        customer_button.clicked.connect(self.customer_only)
        manager_button = QPushButton('Manager Only')
        manager_button.clicked.connect(self.manager_only)
        man_cust_button = QPushButton('Manager-Customer')
        man_cust_button.clicked.connect(self.manager_customer)
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)

        vbox_layout.addWidget(user_button)
        vbox_layout.addWidget(customer_button)
        vbox_layout.addWidget(manager_button)
        vbox_layout.addWidget(man_cust_button)
        vbox_layout.addWidget(back_button)
        self.setLayout(vbox_layout)


    def user_only(self):
        user_reg_screen = registration_classes.user_register_popup(self)
        user_reg_screen.exec_()

    def customer_only(self):
        user_reg_screen = registration_classes.cust_registration_popup(self)
        user_reg_screen.exec_()

    def manager_only(self):
        user_reg_screen = registration_classes.man_registration_popup(self)
        user_reg_screen.exec_()

    def manager_customer(self):
        user_reg_screen = registration_classes.man_cust_registration_popup(self)
        user_reg_screen.exec_()

    def back_clicked(self):
        self.close()
        login.password.clear()
        login.password.setFocus()
        login.exec()


class existing_user_popup(QDialog):
    def __init__(self, username):
        super(existing_user_popup, self).__init__()
        self.setWindowTitle("Existing Username")
        self.message = QLabel(f'{username} already exists. Please try to log in with a valid password.')
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


def functionality_delegator(username):
    login.close()
    cursor = connection.cursor()

    query = 'SELECT * FROM Employee WHERE username = %s;'
    cursor.execute(query, username)
    emp = cursor.fetchone()

    if not emp:
        query = 'SELECT * FROM Customer WHERE username = %s;'
        cursor.execute(query, username)
        customer = cursor.fetchone()
        if customer:
            account_type = 'Customer'
        else:
            account_type = 'User'
    else:
        query = 'SELECT * FROM Manager WHERE username = %s;'
        cursor.execute(query, username)
        manager = cursor.fetchone()
        if not manager:
            emp_type = 'Admin'
        else:
            emp_type = 'Manager'
        account_type = emp_type
        query = 'SELECT * FROM Customer WHERE username = %s;'
        cursor.execute(query, username)
        customer = cursor.fetchone()
        if customer:
            account_type = f'{emp_type}, Customer'

    if account_type == 'Admin':
        admin_only_object = functionality_classes.admin_only(login)
        admin_only_object.exec()
    elif 'Admin' in account_type and 'Customer' in account_type:
        admin_customer_object = functionality_classes.admin_customer(login)
        admin_customer_object.exec()
    elif account_type == 'Manager':
        manager_only_object = functionality_classes.manager_only(login)
        manager_only_object.exec()
    elif 'Manager' in account_type and 'Customer' in account_type:
        manager_customer_object = functionality_classes.manager_customer(login)
        manager_customer_object.exec()
    elif account_type == 'Customer':
        customer_only_object = functionality_classes.customer_only(login)
        customer_only_object.exec()
    elif account_type == 'User':
        user_only_object = functionality_classes.user_only(login)
        user_only_object.exec()


if __name__=='__main__':
    app = QApplication(sys.argv)

    login = DbLoginDialog()
    login.show()
    sys.exit(app.exec_())


