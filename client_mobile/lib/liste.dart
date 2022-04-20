import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      DataColumn(
        label: Text("Action"),
      ),
    ],
    rows: data.map((data) {
      return DataRow(cells: [
        DataCell(Text(data.product_title)),
        DataCell(Text(data.product_price)),
        DataCell(Text(data.created_at)),
        DataCell(FlutterLogo())
      ]);
    }).toList(),
  );
}

class Data {
  String product_title;
  String product_price;
  String created_at;
  Data(this.product_title, this.product_price, this.created_at);
}
