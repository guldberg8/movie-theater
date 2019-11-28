import sys, pymysql, registration_classes, UI, admin_func, cust_func, manager_func
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


class admin_only(QDialog):
    def __init__(self, login):
        super(admin_only, self).__init__()
        self.setWindowTitle("Admin-Only Functionality")
        self.message = QLabel('Admin-Only Functionality')
        self.login = login

        manage_user_button = QPushButton('Manage User')
        manage_company_button = QPushButton('Manage Company')
        create_movie_button = QPushButton('Create Movie')
        back_button = QPushButton('Back')

        manage_user_button.clicked.connect(self.man_user_clicked)
        manage_company_button.clicked.connect(self.man_comp_clicked)
        create_movie_button.clicked.connect(self.create_movie_clicked)
        back_button.clicked.connect(self.back_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(manage_user_button)
        vbox.addWidget(manage_company_button)
        vbox.addWidget(create_movie_button)
        vbox.addWidget(back_button)
        self.setLayout(vbox)

    def man_user_clicked(self):
        manage_user = admin_func.manage_user()
        manage_user.exec_()

    def man_comp_clicked(self):
        manage_cust = admin_func.manage_comp()
        manage_cust.exec_()

    def create_movie_clicked(self):
        create_movie = admin_func.create_movie()
        create_movie.exec_()

    def back_clicked(self):
        self.close()
        self.login.exec_()


class admin_customer(QDialog):
    def __init__(self, login):
        super(admin_customer, self).__init__()
        self.setWindowTitle("Admin-Customer Functionality")
        self.message = QLabel('Admin-Customer Functionality')
        self.login = login

        manage_user_button = QPushButton('Manage User')
        manage_company_button = QPushButton('Manage Company')
        create_movie_button = QPushButton('Create Movie')
        back_button = QPushButton('Back')
        explore_movie_button = QPushButton('Explore Movie')
        explore_theater = QPushButton('Explore Theater')
        view_history = QPushButton('View History')
        visit_history = QPushButton('Visit History')

        manage_user_button.clicked.connect(self.man_user_clicked)
        manage_company_button.clicked.connect(self.man_comp_clicked)
        create_movie_button.clicked.connect(self.create_movie_clicked)
        back_button.clicked.connect(self.back_clicked)
        explore_movie_button.clicked.connect(self.explore_clicked)
        visit_history.clicked.connect(self.view_history_clicked)
        explore_theater.clicked.connect(self.explore_theater_clicked)
        view_history.clicked.connect(self.view_history_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        hbox = QHBoxLayout()
        vbox2 = QVBoxLayout()
        vbox2.addWidget(manage_user_button)
        vbox2.addWidget(manage_company_button)
        vbox2.addWidget(create_movie_button)
        vbox2.addWidget(visit_history)

        vbox3 = QVBoxLayout()
        vbox3.addWidget(explore_movie_button)
        vbox3.addWidget(explore_theater)
        vbox3.addWidget(view_history)
        vbox3.addWidget(back_button)

        hbox.addItem(vbox2)
        hbox.addItem(vbox3)
        vbox.addItem(hbox)
        self.setLayout(vbox)

    def man_user_clicked(self):
        manage_user = admin_func.manage_user()
        manage_user.exec_()

    def man_comp_clicked(self):
        manage_cust = admin_func.manage_comp()
        manage_cust.exec_()

    def create_movie_clicked(self):
        create_movie = admin_func.create_movie()
        create_movie.exec_()

    def back_clicked(self):
        self.close()
        self.login.exec_()

    def explore_clicked(self):
        explore = cust_func.explore()
        explore.exec_()

    def visit_history_clicked(self):
        vist_hist = cust_func.vist_history()
        vist_hist.exec_()

    def explore_theater_clicked(self):
        explore_theater = cust_func.explore_theater()
        explore_theater.exec_()

    def view_history_clicked(self):
        view_hist = cust_func.view_history()
        view_hist.exec_()


class manager_only(QDialog):
    def __init__(self, login):
        super(manager_only, self).__init__()
        self.setWindowTitle("Manager-Only Functionality")
        self.message = QLabel('Manager-Only Functionality')
        self.login = login

        theater_overview_button = QPushButton('Theater Overview')
        schedule_movie_button = QPushButton('Schedule Movie')
        back_button = QPushButton('Back')

        theater_overview_button.clicked.connect(self.theater_overview_clicked)
        schedule_movie_button.clicked.connect(self.schedule_movie_clicked)
        back_button.clicked.connect(self.back_clicked)


        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(theater_overview_button)
        vbox.addWidget(schedule_movie_button)
        vbox.addWidget(back_button)

        self.setLayout(vbox)

    def theater_overview_clicked(self):
        theater_overview = manager_func.theater_overview()
        theater_overview.exec_()

    def schedule_movie_clicked(self):
        schedule_movie = manager_func.schedule_movie()
        schedule_movie.exec_()

    def back_clicked(self):
        self.close()
        self.login.exec_()


class manager_customer(QDialog):
    def __init__(self, login):
        super(manager_customer, self).__init__()
        self.setWindowTitle("Manager-Customer Functionality")
        self.message = QLabel('Manager-Customer Functionality')
        self.login = login

        theater_overview_button = QPushButton('Theater Overview')
        schedule_movie_button = QPushButton('Schedule Movie')
        view_history_button = QPushButton('View History')
        back_button = QPushButton('Back')
        explore_movie_button = QPushButton('Explore Movie')
        explore_theater = QPushButton('Explore Theater')
        visit_history = QPushButton('Visit History')

        theater_overview_button.clicked.connect(self.theater_overview_clicked)
        schedule_movie_button.clicked.connect(self.sched_movie_clicked)
        view_history_button.clicked.connect(self.view_history_clicked)
        back_button.clicked.connect(self.back_clicked)
        explore_movie_button.clicked.connect(self.explore_clicked)
        visit_history.clicked.connect(self.visit_history_clicked)
        explore_theater.clicked.connect(self.explore_theater_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        hbox = QHBoxLayout()
        vbox2 = QVBoxLayout()
        vbox2.addWidget(theater_overview_button)
        vbox2.addWidget(schedule_movie_button)
        vbox2.addWidget(view_history_button)

        vbox3 = QVBoxLayout()
        vbox3.addWidget(explore_movie_button)
        vbox3.addWidget(explore_theater)
        vbox3.addWidget(visit_history)

        hbox.addItem(vbox2)
        hbox.addItem(vbox3)
        vbox.addItem(hbox)
        vbox.addWidget(back_button)
        self.setLayout(vbox)

    def theater_overview_clicked(self):
        manage_user = manager_func.theater_overview()
        manage_user.exec_()

    def sched_movie_clicked(self):
        manage_cust = manager_func.schedule_movie()
        manage_cust.exec_()

    def back_clicked(self):
        self.close()
        self.login.exec_()

    def explore_clicked(self):
        explore = cust_func.explore()
        explore.exec_()

    def explore_theater_clicked(self):
        explore_theater = cust_func.explore_theater()
        explore_theater.exec_()

    def view_history_clicked(self):
        view_hist = cust_func.view_history()
        view_hist.exec_()

    def visit_history_clicked(self):
        visit_hist = cust_func.vist_history()
        visit_hist.exec_()


class customer_only(QDialog):
    def __init__(self, login):
        super(customer_only, self).__init__()
        self.setWindowTitle("Customer Functionality")
        self.message = QLabel('Customer Functionality')
        self.login = login


        view_history_button = QPushButton('View History')
        back_button = QPushButton('Back')
        explore_movie_button = QPushButton('Explore Movie')
        explore_theater = QPushButton('Explore Theater')
        visit_history = QPushButton('Visit History')

        view_history_button.clicked.connect(self.view_history_clicked)
        back_button.clicked.connect(self.back_clicked)
        explore_movie_button.clicked.connect(self.explore_clicked)
        visit_history.clicked.connect(self.visit_history_clicked)
        explore_theater.clicked.connect(self.explore_theater_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        hbox = QHBoxLayout()
        vbox2 = QVBoxLayout()
        vbox2.addWidget(explore_movie_button)
        vbox2.addWidget(explore_theater)

        vbox3 = QVBoxLayout()
        vbox3.addWidget(view_history_button)
        vbox3.addWidget(visit_history)

        hbox.addItem(vbox2)
        hbox.addItem(vbox3)
        vbox.addItem(hbox)
        vbox.addWidget(back_button)
        self.setLayout(vbox)


    def back_clicked(self):
        self.close()
        self.login.exec_()

    def explore_clicked(self):
        explore = cust_func.explore()
        explore.exec_()

    def explore_theater_clicked(self):
        explore_theater = cust_func.explore_theater()
        explore_theater.exec_()

    def view_history_clicked(self):
        view_hist = cust_func.view_history()
        view_hist.exec_()

    def visit_history_clicked(self):
        visit_hist = cust_func.vist_history()
        visit_hist.exec_()


class user_only(QDialog):
    def __init__(self, login):
        super(user_only, self).__init__()
        self.setWindowTitle("User Functionality")
        self.message = QLabel('User Functionality')
        self.login = login

        back_button = QPushButton('Back')
        explore_theater = QPushButton('Explore Theater')
        visit_history = QPushButton('Visit History')

        back_button.clicked.connect(self.back_clicked)
        visit_history.clicked.connect(self.visit_history_clicked)
        explore_theater.clicked.connect(self.explore_theater_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.message)
        vbox.addWidget(explore_theater)
        vbox.addWidget(visit_history)
        vbox.addWidget(back_button)
        self.setLayout(vbox)

    def back_clicked(self):
        self.close()
        self.login.exec_()


    def explore_theater_clicked(self):
        explore_theater = cust_func.explore_theater()
        explore_theater.exec_()

    def visit_history_clicked(self):
        visit_hist = cust_func.vist_history()
        visit_hist.exec_()
