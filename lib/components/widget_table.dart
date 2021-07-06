import 'package:flutter/material.dart';

typedef Function RowClickHandler(int rowIndex);

class WidgetTableWidget extends StatelessWidget {
  const WidgetTableWidget({
    Key key,
    this.columns,
    this.tableData,
  }) : super(key: key);

  final List<String> columns;
  final List<List<Widget>> tableData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      //color: Colors.white,
      child: DataTable(
        columns: buildColumns(columns),
        rows: buildTableRows(tableData),
      ),
    );
  }

  List<DataRow> buildTableRows(List<List<Widget>> rows) {
    return rows
        .asMap()
        .entries
        .map((
        e,
        ) =>
        DataRow(
          cells: e.value
              .map((i) => DataCell(
            i
          ))
              .toList(),
        ))
        .toList();
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
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
    )
        .toList();
  }
}
