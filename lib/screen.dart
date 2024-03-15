import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';
import 'detalles.dart';

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    // Carga el JSON desde el archivo assets
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data_scrum.json');
    List<dynamic> jsonList = json.decode(jsonString);

    // Convierte el JSON en objetos Dart
    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 233, 236, 29),
        title: Container(
          child: Text('¿Qué es scrum?', style:TextStyle(color:Colors.white, fontWeight: FontWeight.bold)),
      )),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Navega a la pantalla de detalles cuando se hace clic en un elemento
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(itemName: items[index].name, itemImage: items[index].image, itemDescription: items[index].description, itemExample:items[index].example ),
                ),
              );
            },
            child: ListTile(
              title: Text(items[index].name,
              textAlign: TextAlign.center),
            ),
            hoverColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
          );
        },
      ),
    );
  }
}
