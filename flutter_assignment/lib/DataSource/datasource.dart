import 'package:flutter/material.dart';
import 'package:flutter_assignment/db/DatabaseHandler.dart';
import 'package:flutter_assignment/models/data.dart';

class MyData extends DataTableSource {
  DatabaseHandler handler;
  List<data> _data;

  MyData(this._data, this.handler);

  bool get isRowCountApproximate => false;

  int get rowCount => _data.length;

  int get selectedRowCount => 0;

  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index].name.toString())),
      DataCell(Text(_data[index].mobile_no.toString())),
    ]);
  }

  List<DataRow> getRows(List<data> users) => users.map((data _data) {
        final cells = [
          _data.name,
          _data.mobile_no,
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
