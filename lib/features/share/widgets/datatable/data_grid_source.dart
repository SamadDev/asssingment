import '../text_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MyDataGridSource extends DataGridSource {
  final List<DataGridRow> _dataGridRows;

  MyDataGridSource(this._dataGridRows);

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.value.runtimeType != String &&
            dataGridCell.value.runtimeType != double &&
            dataGridCell.value.runtimeType != int) {
          return dataGridCell.value as Widget;
        }

        String value = dataGridCell.value.toString();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.centerLeft,
          child: TextWidget(value),
        );
      }).toList(),
    );
  }
}
