import sys, pymysql, UI, functionality_classes
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


class invalid_registration(QDialog):
    def __init__(self, reg_scren, type):
        super(invalid_registration, self).__init__()
        self.setWindowTitle("Invalid Registration")
        self.type = type
        self.message = QLabel('')
        self.reg_screen = reg_scren

        v_box = QVBoxLayout()
        if type == 1:
            self.message = QLabel('Please make sure your passwords match.')
        elif type == 2:
            self.message = QLabel('Please fill out all fields.')
        elif type == 3:
            self.message = QLabel('Username already exists. Please try another.')
        elif type == 4:
            self.message = QLabel('Password must be at least 8 characters.')
        elif type == 5:
            self.message = QLabel('A manager already exists with the given street address.')

        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        v_box.addWidget(self.message)
        v_box.addWidget(back_button)
        self.setLayout(v_box)


    def back_clicked(self):
        self.close()
        if self.type == 1:
            self.reg_screen.password.clear()
            self.reg_screen.confirm_pass.clear()
        self.reg_screen.exec_()


class user_register_popup(QDialog):
    def __init__(self, nav_screen):
        super(user_register_popup, self).__init__()
        self.setWindowTitle("User Registration")
        self.nav_screen = nav_screen
        self.user = QLineEdit()
        self.password = QLineEdit()
        self.password.setEchoMode(QLineEdit.Password)
        self.first_name = QLineEdit()
        self.last_name = QLineEdit()
        self.confirm_pass = QLineEdit()
        self.confirm_pass.setEchoMode(QLineEdit.Password)
        self.line_edits = [self.user, self.password, self.first_name, self.last_name, self.confirm_pass]

        row_1 = QHBoxLayout()
        form_group_box = QGroupBox("User Registration")
        layout = QFormLayout()
        row_1.addWidget(QLabel('First Name:'))
        row_1.addWidget(self.first_name)
        row_1.addWidget(QLabel('Last Name:'))
        row_1.addWidget(self.last_name)
        layout.addRow(row_1)
        layout.addRow(QLabel("Username:"), self.user)
        row_2 = QHBoxLayout()
        row_2.addWidget(QLabel('Password:'))
        row_2.addWidget(self.password)
        row_2.addWidget(QLabel('Confirm Password:'))
        row_2.addWidget(self.confirm_pass)
        layout.addRow(row_2)

        register_button = QPushButton('Register')
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        register_button.clicked.connect(self.register_user)
        layout.addRow(back_button, register_button)
        form_group_box.setLayout(layout)

        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(form_group_box)
        self.setLayout(vbox_layout)
        self.first_name.setFocus()
        register_button.setDefault(True)

    def register_user(self):
        ty = 0
        username = self.user.text().strip()
        connection = UI.connection
        cursor = connection.cursor()
        query = 'SELECT * FROM User WHERE username = %s;'
        cursor.execute(query, username)
        user = cursor.fetchone()

        empty = False
        for item in self.line_edits:
            if item.text() == '':
                empty = True
        if empty:
            ty = 2
        elif user != None:
            ty = 3
        elif self.password.text() != self.confirm_pass.text():
            ty = 1
        elif len(self.password.text()) < 8:
            ty = 4

        # If an error
        if ty:
            invalid_window = invalid_registration(self, ty)
            invalid_window.exec_()
        else:
            query = 'INSERT INTO User (username, status, password, firstName, lastName) values (%s, %s, %s, %s, %s);'
            cursor.execute(query,
                               [self.user.text(), 'Approved', self.password.text(),
                                self.first_name.text(), self.last_name.text()])
            connection.commit()
            self.close()
            functionality_delegator('user', self.nav_screen)

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
        self.password.setEchoMode(QLineEdit.Password)
        self.first_name = QLineEdit()
        self.last_name = QLineEdit()
        self.confirm_pass = QLineEdit()
        self.confirm_pass.setEchoMode(QLineEdit.Password)
        self.line_edits = [self.user, self.password, self.first_name, self.last_name, self.confirm_pass]

        row_1 = QHBoxLayout()
        form_group_box = QGroupBox("Customer Registration")
        layout = QFormLayout()
        row_1.addWidget(QLabel('First Name:'))
        row_1.addWidget(self.first_name)
        row_1.addWidget(QLabel('Last Name:'))
        row_1.addWidget(self.last_name)
        layout.addRow(row_1)
        layout.addRow(QLabel("Username:"), self.user)
        row_2 = QHBoxLayout()
        row_2.addWidget(QLabel('Password:'))
        row_2.addWidget(self.password)
        row_2.addWidget(QLabel('Confirm Password:'))
        row_2.addWidget(self.confirm_pass)
        layout.addRow(row_2)

        register_button = QPushButton('Register')
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        register_button.clicked.connect(self.register_user)
        layout.addRow(back_button, register_button)
        form_group_box.setLayout(layout)
        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(form_group_box)


        self.setLayout(vbox_layout)
        self.first_name.setFocus()
        register_button.setDefault(True)

    def register_user(self):
        ty = 0
        username = self.user.text().strip()
        connection = UI.connection
        cursor = connection.cursor()
        query = 'SELECT * FROM User WHERE username = %s;'
        cursor.execute(query, username)
        user = cursor.fetchone()

        empty = False
        for item in self.line_edits:
            if item.text() == '':
                empty = True
        if empty:
            ty = 2
        elif user:
            ty = 3
        elif self.password.text() != self.confirm_pass.text():
            ty = 1
        elif len(self.password.text()) < 8:
            ty = 4

        # If an error
        if ty:
            invalid_window = invalid_registration(self, ty)
            invalid_window.exec_()
        else:
            query = 'INSERT INTO User (username, status, password, firstName, lastName) values (%s, %s, %s, %s, %s);'
            cursor.execute(query,
                           [username, 'Approved', self.password.text(),
                            self.first_name.text(), self.last_name.text()])
            query = 'INSERT INTO CUSTOMER (username) values (%s)'

            cursor.execute(query, [username])
            connection.commit()
            self.close()
            functionality_delegator('customer', self.nav_screen)

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
        self.password.setEchoMode(QLineEdit.Password)
        self.first_name = QLineEdit()
        self.last_name = QLineEdit()
        self.confirm_pass = QLineEdit()
        self.confirm_pass.setEchoMode(QLineEdit.Password)
        self.address = QLineEdit()
        self.city = QLineEdit()
        self.state = QComboBox()
        self.zipcode = QLineEdit()
        self.company = QComboBox()
        self.line_edits = [self.user, self.password, self.first_name, self.last_name, self.confirm_pass,
                           self.address, self.city, self.zipcode]

        states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                  "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
                  "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
                  "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
                  "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

        connection = UI.connection
        cursor = connection.cursor()
        query = 'SELECT * FROM Company;'
        cursor.execute(query)
        companies = cursor.fetchall()
        for company in companies:
            self.company.addItem(company['name'])
        for state in states:
            self.state.addItem(state)

        row_1 = QHBoxLayout()
        form_group_box = QGroupBox("Manager-Customer Registration")
        layout = QFormLayout()
        row_1.addWidget(QLabel('First Name:'))
        row_1.addWidget(self.first_name)
        row_1.addWidget(QLabel('Last Name:'))
        row_1.addWidget(self.last_name)
        layout.addRow(row_1)
        in_between_row = QHBoxLayout()
        in_between_row.addWidget(QLabel("Username:"))
        in_between_row.addWidget(self.user)
        in_between_row.addWidget(QLabel("Company:"))
        in_between_row.addWidget(self.company)
        layout.addRow(in_between_row)
        row_2 = QHBoxLayout()
        row_2.addWidget(QLabel('Password:'))
        row_2.addWidget(self.password)
        row_2.addWidget(QLabel('Confirm Password:'))
        row_2.addWidget(self.confirm_pass)
        layout.addRow(row_2)
        row_3 = QHBoxLayout()
        row_3.addWidget(QLabel('Street Address:'))
        row_3.addWidget(self.address)
        layout.addRow(row_3)
        row_4 = QHBoxLayout()
        row_4.addWidget(QLabel('City:'))
        row_4.addWidget(self.city)
        row_4.addWidget(QLabel('State:'))
        row_4.addWidget(self.state)
        row_4.addWidget(QLabel('Zipcode:'))
        row_4.addWidget(self.zipcode)
        layout.addRow(row_4)

        register_button = QPushButton('Register')
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        register_button.clicked.connect(self.register_user)
        layout.addRow(back_button, register_button)
        form_group_box.setLayout(layout)

        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(form_group_box)
        self.setLayout(vbox_layout)
        self.first_name.setFocus()
        register_button.setDefault(True)

    def register_user(self):
        ty = 0
        username = self.user.text().strip()
        connection = UI.connection
        cursor = connection.cursor()
        query = 'SELECT * FROM User WHERE username = %s;'
        cursor.execute(query, username)
        user = cursor.fetchone()

        check_address_query = 'SELECT * FROM Manager WHERE street = %s and state = %s and city = %s and zipcode = %s;'
        cursor.execute(check_address_query,
                       [self.address.text(), self.state.currentText(), self.city.text(), self.zipcode.text()])
        street_address_found = cursor.fetchone()

        empty = False
        for item in self.line_edits:
            if item.text() == '':
                empty = True
        if empty:
            ty = 2
        elif user:
            ty = 3
        elif self.password.text() != self.confirm_pass.text():
            ty = 1
        elif len(self.password.text()) < 8:
            ty = 4
        elif street_address_found:
            ty = 5

        # If an error
        if ty:
            invalid_window = invalid_registration(self, ty)
            invalid_window.exec_()
        else:
            query = 'INSERT INTO User (username, status, password, firstName, lastName) values (%s, %s, %s, %s, %s);'
            cursor.execute(query,
                           [self.user.text(), 'Approved', self.password.text(),
                            self.first_name.text(), self.last_name.text()])
            connection.commit()

            man_query = 'INSERT INTO Manager (username, street, city, zipcode, companyName, state) values (%s, %s, %s, %s, %s, %s);'
            cursor.execute(man_query,
                           [self.user.text(), self.address.text(),
                            self.city.text(), self.zipcode.text(),
                            self.company.currentText(), self.state.currentText()])
            connection.commit()
            self.close()
            functionality_delegator('man-cust', self.nav_screen)
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
        self.password.setEchoMode(QLineEdit.Password)
        self.first_name = QLineEdit()
        self.last_name = QLineEdit()
        self.confirm_pass = QLineEdit()
        self.confirm_pass.setEchoMode(QLineEdit.Password)
        self.address = QLineEdit()
        self.city = QLineEdit()
        self.state = QComboBox()
        self.zipcode = QLineEdit()
        self.company = QComboBox()
        self.line_edits = [self.user, self.password, self.first_name, self.last_name, self.confirm_pass,
                      self.address, self.city, self.zipcode]

        states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                  "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
                  "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
                  "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
                  "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

        connection = UI.connection
        cursor = connection.cursor()
        query = 'SELECT * FROM Company;'
        cursor.execute(query)
        companies = cursor.fetchall()
        for company in companies:
            self.company.addItem(company['name'])
        for state in states:
            self.state.addItem(state)

        row_1 = QHBoxLayout()
        form_group_box = QGroupBox("Manager-Only Registration")
        layout = QFormLayout()
        row_1.addWidget(QLabel('First Name:'))
        row_1.addWidget(self.first_name)
        row_1.addWidget(QLabel('Last Name:'))
        row_1.addWidget(self.last_name)
        layout.addRow(row_1)
        in_between_row = QHBoxLayout()
        in_between_row.addWidget(QLabel("Username:"))
        in_between_row.addWidget(self.user)
        in_between_row.addWidget(QLabel("Company:"))
        in_between_row.addWidget(self.company)
        layout.addRow(in_between_row)
        row_2 = QHBoxLayout()
        row_2.addWidget(QLabel('Password:'))
        row_2.addWidget(self.password)
        row_2.addWidget(QLabel('Confirm Password:'))
        row_2.addWidget(self.confirm_pass)
        layout.addRow(row_2)
        row_3 = QHBoxLayout()
        row_3.addWidget(QLabel('Street Address:'))
        row_3.addWidget(self.address)
        layout.addRow(row_3)
        row_4 = QHBoxLayout()
        row_4.addWidget(QLabel('City:'))
        row_4.addWidget(self.city)
        row_4.addWidget(QLabel('State:'))
        row_4.addWidget(self.state)
        row_4.addWidget(QLabel('Zipcode:'))
        row_4.addWidget(self.zipcode)
        layout.addRow(row_4)

        register_button = QPushButton('Register')
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)
        register_button.clicked.connect(self.register_user)
        layout.addRow(back_button, register_button)
        form_group_box.setLayout(layout)

        vbox_layout = QVBoxLayout()
        vbox_layout.addWidget(form_group_box)
        self.setLayout(vbox_layout)
        self.first_name.setFocus()
        register_button.setDefault(True)

    def register_user(self):
        ty = 0
        username = self.user.text().strip()
        connection = UI.connection
        cursor = connection.cursor()
        query = 'SELECT * FROM User WHERE username = %s;'
        cursor.execute(query, username)
        user = cursor.fetchone()

        check_address_query = 'SELECT * FROM Manager WHERE street = %s and state = %s and city = %s and zipcode = %s;'
        cursor.execute(check_address_query,
                       [self.address.text(), self.state.currentText(), self.city.text(), self.zipcode.text()])
        street_address_found = cursor.fetchone()

        empty = False
        for item in self.line_edits:
            if item.text() == '':
                empty = True
        if empty:
            ty = 2
        elif user:
            ty = 3
        elif self.password.text() != self.confirm_pass.text():
            ty = 1
        elif len(self.password.text()) < 8:
            ty = 4
        elif street_address_found:
            ty = 5

        # If an error
        if ty:
            invalid_window = invalid_registration(self, ty)
            invalid_window.exec_()
        else:
            query = 'INSERT INTO User (username, status, password, firstName, lastName) values (%s, %s, %s, %s, %s);'
            cursor.execute(query,
                               [self.user.text(), 'Pending', self.password.text(),
                                self.first_name.text(), self.last_name.text()])
            connection.commit()

            man_query = 'INSERT INTO Manager (username, street, city, zipcode, companyName, state) values (%s, %s, %s, %s, %s, %s);'
            cursor.execute(man_query,
                           [self.user.text(), self.address.text(),
                            self.city.text(), self.zipcode.text(),
                            self.company.currentText(), self.state.currentText()])
            connection.commit()
            self.close()
            functionality_delegator('manager', self.nav_screen)

    def back_clicked(self):
        self.close()
        self.nav_screen.exec_()


def functionality_delegator(user_type, nav_screen):
    if user_type == 'user':
        func_screen = functionality_classes.user_only(user_register_popup(nav_screen))
    elif user_type == 'manager':
        func_screen = functionality_classes.manager_only(man_registration_popup(nav_screen))
    elif user_type == 'man-cust':
        func_screen = functionality_classes.manager_customer(man_cust_registration_popup(nav_screen))
    elif user_type == 'customer':
        func_screen = functionality_classes.customer_only(cust_registration_popup(nav_screen))
    func_screen.exec_()