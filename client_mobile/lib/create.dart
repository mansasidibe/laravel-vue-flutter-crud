import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout de produit"),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
           TextField(
              decoration: InputDecoration(
                labelText: 'Nom du produit',
                hintText: "nom ici",
              ),
            ),
            
            TextField(
              decoration: InputDecoration(
                labelText: 'Prix du produit',
                hintText: "prix ici",
              ),
            ),
    
            RaisedButton(
              onPressed: () {
                // FAIRE DES CHOSES ICI
              },
              child: Text("Ajouter le produit"),
            )
          ],
        ),
      ),
    );
  }
}