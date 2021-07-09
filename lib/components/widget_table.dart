import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/material.dart';

typedef Function RowClickHandler(int rowIndex);

class WidgetTableWidget extends StatelessWidget {
  WidgetTableWidget({
    Key key,
    this.rowCheckBox = true,
    this.columns,
    this.tableData,
    this.rowClickHandler,
  }) : super(key: key);

  final List<String> columns;
  final List<List<Widget>> tableData;
  final RowClickHandler rowClickHandler;
  bool rowCheckBox;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: 5,
        columns: buildColumns(columns),
        rows: buildTableRows(tableData),
      );
  }

  List<DataRow> buildTableRows(List<List<Widget>> rows) {
    if(rowCheckBox) {
      return rows
          .asMap()
          .entries
          .map((e,) =>
          DataRow(
            onSelectChanged: (value) {
              rowClickHandler(e.key);
            },
            cells: e.value
                .map((i) =>
                DataCell(
                    i
                ))
                .toList(),
          ))
          .toList();
    } else {
      return rows
          .asMap()
          .entries
          .map((e,) =>
          DataRow(
            cells: e.value
                .map((i) =>
                DataCell(
                    i
                ))
                .toList(),
          ))
          .toList();
    }
  }

  List<DataColumn> buildColumns(List<String> columns) {
    return columns
        .map(
          (
          e,
          ) =>
          DataColumn(
            label: Text(
              e,
              style: TextStyle(
                color: bodyColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
    )
        .toList();
  }
}
