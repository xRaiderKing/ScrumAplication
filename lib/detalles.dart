import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final String itemDescription;
  final String itemExample;

  ItemDetailsScreen({required this.itemName, required this.itemImage, required this.itemDescription, required this.itemExample});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 251, 0),
        title: Text('Detalles'),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ajusta el padding según sea necesario
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(itemImage, width: 300),
              SizedBox(height: 20), // Espacio entre la imagen y el texto
              Text(
                itemName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Espacio entre el nombre y la descripción
              Text(
                'Descripcion: $itemDescription',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10), // Espacio entre la descripción y el ejemplo
              Text(
                'Ejemplo: $itemExample',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
