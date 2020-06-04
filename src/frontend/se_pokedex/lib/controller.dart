import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'model.dart';

class Controller {


  final Client client = Client();

  Future<List<Pokemon>> getList() async {
    print("Getting body");


    var request = await client.get("http://10.0.2.2:5000/pokemon");

    print("Data ${request.statusCode} ${request.body}");

    List<dynamic> pokemon = jsonDecode(request.body);

    var pokemonList = pokemon.map((e) => Pokemon.fromJson(e)).toList();

    print("Fetched ${pokemonList.length} pokemon");

    return pokemonList;
  }
}