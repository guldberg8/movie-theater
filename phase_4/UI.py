################################################################################
# MAKE SURE YOUR DIRECTORY HAS THE FOLLOWING STRUCTURE                         #
# user -                                                                       #
#       ...                                                                    #
#          - HW08                                                              #
#                - data                                                        #
#                       - sets.csv                                             #
#                       - inventories.csv                                      #
#                       ...                                                    #
#                       - part_categories.csv                                  #
#                - HW08.py                                                     #
#                - insert_lego_database.pymysql                                #
#                - lego-database-schema.sql                                    #
################################################################################
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


class SimpleTableModel(QAbstractTableModel):
    def __init__(self, data):
        QAbstractTableModel.__init__(self, None)
        self.data = data
        self.headers = [str(k) for k, v in data[0].items()]
        self.rows = [[str(v) for k, v in record.items()] for record in data]
    def rowCount(self, parent):
        return len(self.rows)
    def columnCount(self, parent):
        return len(self.headers)
    def data(self, index, role):
        if (not index.isValid()) or (role != Qt.DisplayRole):
            return QVariant()
        else:
            return QVariant(self.rows[index.row()][index.column()])
    def row(self, index):
        return self.data[index]
    def headerData(self, section, orientation, role):
        if role != Qt.DisplayRole:
            return QVariant()
        elif orientation == Qt.Vertical:
            return section + 1
        else:
            return self.headers[section]


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
        query = 'SELECT '

    def register(self):
        print('reg')



class NavigationWindow(QDialog):
    def __init__(self):
        super(NavigationWindow, self).__init__()
        self.setWindowTitle("Navigation Window")
        cursor = connection.cursor()
        cursor.execute('show tables')
        vbox_layout = QVBoxLayout()

        self.button1 = QPushButton('Question 1')
        self.button1.clicked.connect(self.q1)
        vbox_layout.addWidget(self.button1)

        self.setLayout(vbox_layout)

    def q1(self):
        self.close()
        Question1().exec()


class Question1(QDialog):
    def __init__(self):
        super(Question1, self).__init__()
        curs = connection.cursor()
        query = 'SELECT * from ADMIN;'
        curs.execute(query)
        data = curs.fetchall()[0:50]

        self.setWindowTitle("Question 1")
        self.table_model = SimpleTableModel(data)
        self.table_view = QTableView()
        self.table_view.setModel(self.table_model)
        self.table_view.setSelectionMode(QAbstractItemView.SelectRows | QAbstractItemView.SingleSelection)

        self.back_button = QPushButton('Back')
        self.back_button.clicked.connect(self.back_button_clicked)

        vbox = QVBoxLayout()
        vbox.addWidget(self.table_view)
        vbox.addWidget(self.back_button)
        self.setLayout(vbox)

    def back_button_clicked(self):
        self.close()
        NavigationWindow().exec()



    def back_button_clicked(self):
        self.close()
        NavigationWindow().exec()


    def show_item(self):
        current_index = self.table_view.currentIndex().row()
        selected_item = self.table_model.row(current_index)
        SetDetailDialog(selected_item).exec()

    def enable_show_item_button(self):
        if self.table_view.currentIndex() == -1:
            self.show_item_button.setEnabled(False)
        else:
            self.show_item_button.setEnabled(True)



class SetDetailDialog(QDialog):
    def __init__(self, selected_item):
        super(SetDetailDialog, self).__init__()
        self.setWindowTitle("Set Detail Dialog")
        vbox_layout = QVBoxLayout()
        button = QDialogButtonBox(QDialogButtonBox.Ok)
        button.accepted.connect(self.accept)
        form_group_box = QGroupBox()
        layout = QFormLayout()
        for k, v in selected_item.items():
            key = f'{k}:'
            if key == 'set_num:':
                key = 'Set Number:'
            elif key == 'name:':
                key = 'Name:'
            elif key == 'year:':
                key = 'Year:'
            elif key == 'theme_id:':
                key = 'Theme ID:'
            elif key == 'num_parts:':
                key = 'Number of Parts:'
            layout.addRow(QLabel(key), QLabel(str(v)))
        form_group_box.setLayout(layout)
        vbox_layout.addWidget(form_group_box)
        vbox_layout.addWidget(button)
        self.setLayout(vbox_layout)


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


