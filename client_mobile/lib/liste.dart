import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dTable()
    );
  }
}
Widget dTable() {
  var data = <Data>[
    Data("varun", "20", "2001"),
    Data("varun1", "21", "2000"),
    Data("varun2", "23", "1998"),
    Data("varun3", "26", "1995"),
  ];
  return DataTable(
    
    columns: [
      DataColumn(
        label: Text("Name"),
      ),
      DataColumn(
        label: Text("Age"),
      ),
      DataColumn(
        label: Text("Year"),
      ),
      DataColumn(label: FlutterLogo())
    ],
    rows: data.map((data) {
      return DataRow(cells: [
        DataCell(Text(data.name)),
        DataCell(Text(data.age)),
        DataCell(Text(data.year)),
        DataCell(FlutterLogo())
      ]);
    }).toList(),
  );
}

class Data {
  String name;
  String age;
  String year;
  Data(this.name, this.age, this.year);
}
