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


class theater_overview(QDialog):
    def __init__(self, man_screen):
        super(theater_overview, self).__init__()
        self.setWindowTitle("Theater Overview")
        self.back_screen = man_screen

        vbox = QVBoxLayout()
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)

        vbox.addWidget(back_button)
        self.setLayout(vbox)

    def back_clicked(self):
        self.close()
        self.back_screen.exec_()

class schedule_movie(QDialog):
    def __init__(self, man_screen):
        super(schedule_movie, self).__init__()
        self.setWindowTitle("Schedule Movie")
        self.back_screen = man_screen

        vbox = QVBoxLayout()
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)

        vbox.addWidget(back_button)
        self.setLayout(vbox)


    def back_clicked(self):
        self.close()
        self.back_screen.exec_()