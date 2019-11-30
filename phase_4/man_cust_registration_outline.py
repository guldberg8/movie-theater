query = "SELECT creditCardNum from CreditCards WHERE username = %s"
        #do we have username in this scope? I think we need it
        cursor.execute(query, username)

        row_count = 0
        cc_rows = []        
        for row_count,row in enumerate(cursor.fetchall()):
            new_row = QHBoxLayout()

            new_row.addWidget(QLabel(str(row['creditCardNum'])))

            remove_button = QPushButton('Remove')
            #connect to function that removes creditCard
            remove_button.clicked.connect(row['creditCardNum'])

            
            new_row.addWidget(remove_button)
            cc_rows.append(new_row)

        while(row_count<5):
            new_row = QHBoxLayout()

            new_card_line = QLineEdit()

            add_button = QPushButton('Add')
            #set button to trigger query on CC# in this line
            add_button.clicked.connect(new_card_line)

            new_row.addWidget(new_card_line)
            new_row.addWidget(add_button)

            cc_rows.append(new_row)
            row_count += 1

        for row in cc_rows:
            layout.addRow(row)