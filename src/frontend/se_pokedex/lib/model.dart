class Pokemon {
  String name;
  String description;
  String image;
  List<String> type;

  Pokemon(this.name, this.description, this.image, this.type);

  factory Pokemon.fromJson(dynamic json) {
    return Pokemon(json['name'].toString().capitalize(), json['description'], json['image'], List.from(json["types"]));
  }
}


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String capitalizeAll() {
    var l = List();
    this.split(' ').forEach((element) { l.add(element.capitalize()); });
    return l.join(' ');
  }
}