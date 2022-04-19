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
    Data("Samsung", "20000", "2001-12-1"),

  ];
  return DataTable(
    
    columns: [
      DataColumn(
        label: Text("Nom Produit"),
      ),
      DataColumn(
        label: Text("Prix produit"),
      ),
      DataColumn(
        label: Text("Ajouté le"),
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

// A MODIFIER

class Data {
  String name;
  String age;
  String year;
  Data(this.name, this.age, this.year);
}
