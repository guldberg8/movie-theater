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


class vist_history(QDialog):
    def __init__(self):
        super(vist_history, self).__init__()
        self.setWindowTitle("Visit History")


class explore_theater(QDialog):
    def __init__(self):
        super(explore_theater, self).__init__()
        self.setWindowTitle("Explore Theater")


class view_history(QDialog):
    def __init__(self):
        super(view_history, self).__init__()
        self.setWindowTitle("View History")