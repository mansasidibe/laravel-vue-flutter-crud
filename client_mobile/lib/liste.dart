import 'dart:convert';
import 'dart:async';

import 'package:client_mobile/modele.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// FETCHONS LES DONNEES DE L'API
Future<Product> fetchProduit() async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:8000/api/produit'));

  if (response.statusCode == 200) {
    // SI TOUT EST OK, ALORS ON CONVERTI LES DONNEES EN FORMAT JSON.

    return Product.fromJson(jsonDecode(response.body));
  } else {
    // SINON AFFICHAGE ERREUR
    throw Exception('ERREUR DE CHARGEMENT DES PRODUITS, DESOLE');
  }
}


class Product {
  final int product_title;
  final int id;
  final String product_price;

  const Product({
    required this.id,
    required this.product_title,
    required this.product_price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      product_title: json['product_title'],
      id: json['id'],
      product_price: json['product_price'],
    );
  }
}

class MyWidget extends StatelessWidget {

 // INITIALISATION
  late Future<Product> futureProduct;

  // INITIONS LES PRODUITS AJOUTE A UNE VARIABLE QUE LES RECUPER
  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AFFICHAGE DE DONNEES DEPUIS LARAVEL"),
      ),
      body: Center(
        // AFFICHAGE ICI
        child: FutureBuilder<Product>(
            future: futureProduct,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.product_price);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

                // AFFICHAGE DE LA CIRCULEINDICATOR PAR DEFAUT
              return const CircularProgressIndicator();
            },
            ),
      ),
    );
  }
}


