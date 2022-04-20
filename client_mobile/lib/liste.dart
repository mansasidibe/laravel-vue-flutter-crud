import 'dart:convert';

import 'package:client_mobile/modele.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:  APPELER LE TABLEAU ICI
    );
  }
}

// FETCHONS LES DONNEES DE L'API
Future<List<Product>> fetchProduit() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1/api/produit'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  } else {
    throw Exception('Erreur');
  }
}


// AFFICHER MAINTENANT LES DONNEES DANS LE TABLEAU ICI
