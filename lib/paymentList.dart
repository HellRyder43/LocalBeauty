import 'package:flutter/material.dart';
import 'package:local_beauty/widgets/appBar.dart';

import 'bookRepository.dart';
import 'models/bookEvent.dart';

BookRepository bookList = new BookRepository();

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  List<BookEvent> bookEvents = bookList.allBookEvents.toList();
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  void updateSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: const Text('Name'),
        numeric: false,
        tooltip: 'Name of the item',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            bookEvents.sort((item1, item2) => item1.name.compareTo(item2.name));
          } else {
            bookEvents.sort((item1, item2) => item2.name.compareTo(item1.name));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: const Text('Mua Name'),
        numeric: false,
        tooltip: 'Mua Name of the item',
      ),
      DataColumn(
        label: const Text('Price (RM)'),
        numeric: false, // Deliberately set to false to avoid right alignment.
        tooltip: 'Price of the item',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            bookEvents
                .sort((item1, item2) => item1.price.compareTo(item2.price));
          } else {
            bookEvents
                .sort((item1, item2) => item2.price.compareTo(item1.price));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: const Text('Date'),
        numeric: false,
        tooltip: 'Date of the item',
      ),
    ];
  }

  DataRow _createRow(BookEvent item) {
    return DataRow(
      // index: item.id, // for DataRow.byIndex
      key: ValueKey(item.date),
      color: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
          states.contains(MaterialState.selected)
              ? Colors.red
              : Color.fromARGB(100, 215, 217, 219)),
      cells: [
        DataCell(
          Text(item.name.toString()),
        ),
        DataCell(
          Text(item.muaName.toString()),
        ),
        DataCell(
          Text(item.price),
        ),
        DataCell(Text(item.date.toString())),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Payment Record"),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "All Payments",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columnSpacing: 0,
              dividerThickness: 5,
              dataRowHeight: 80,
              dataTextStyle: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.black),
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.pinkAccent),
              headingRowHeight: 80,
              headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              horizontalMargin: 10,
              showBottomBorder: true,
              showCheckboxColumn: false,
              columns: _createColumns(),
              rows: bookEvents.map((item) => _createRow(item)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
