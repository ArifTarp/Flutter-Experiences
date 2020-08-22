import 'package:flutter/material.dart';

class MaterialBannerAndDataTableView extends StatefulWidget {
  MaterialBannerAndDataTableView({Key key}) : super(key: key);

  @override
  _MaterialBannerAndDataTableViewState createState() =>
      _MaterialBannerAndDataTableViewState();
}

class _MaterialBannerAndDataTableViewState
    extends State<MaterialBannerAndDataTableView> {
  bool _selectedFirstRow;
  bool _selectedSecondRow;
  bool _selectedThirdRow;

  @override
  void initState() {
    super.initState();
    _selectedFirstRow = false;
    _selectedSecondRow = false;
    _selectedThirdRow = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [_buildMaterialBanner(), _buildDataTable()],
      ),
    );
  }

  MaterialBanner _buildMaterialBanner() {
    return MaterialBanner(
      leading: Icon(Icons.person_pin_circle),
      content: Text(
        "Material Banner Content",
      ),
      contentTextStyle: TextStyle(fontSize: 20, color: Colors.black),
      actions: [
        Icon(Icons.android),
        Icon(Icons.place),
        Icon(Icons.plus_one),
      ],
      backgroundColor: Colors.orangeAccent,
    );
  }

  DataTable _buildDataTable() {
    return DataTable(
        headingRowHeight: 80,
        dataRowHeight: 100,
        dividerThickness: 6,
        // onSelectAll: (val) {},
        //sortAscending: true,
        // sortColumnIndex: 0,
        columns: [
          DataColumn(label: Text("Column1")),
          DataColumn(label: Text("Column2")),
          DataColumn(label: Text("Column3")),
        ],
        rows: [
          DataRow(
              cells: [
                DataCell(Text("Row0-1")),
                DataCell(Text("Row0-2")),
                DataCell(Text("Row0-3")),
              ],
              onSelectChanged: (val) {
                print(val);
                setState(() {
                  _selectedFirstRow = val;
                });
              },
              selected: _selectedFirstRow),
          DataRow(
              cells: [
                DataCell(Text("Row1-1")),
                DataCell(Text("Row1-2")),
                DataCell(Text("Row1-3")),
              ],
              onSelectChanged: (val) {
                print(val);
                setState(() {
                  _selectedSecondRow = val;
                });
              },
              selected: _selectedSecondRow),
          DataRow(
              cells: [
                DataCell(Text("Row2-1")),
                DataCell(Text("Row2-2")),
                DataCell(Text("Row2-3")),
              ],
              onSelectChanged: (val) {
                print(val);
                setState(() {
                  _selectedThirdRow = val;
                });
              },
              selected: _selectedThirdRow),
        ]);
  }
}
