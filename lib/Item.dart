class Item {
  final String name;
  final String description;
  final String image;
  final String example;

  Item({required this.name, required this.description, required this.image, required this.example});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      description:json['description'],
      image: json['image'],
      example: json['example']
    );
  }
}
