import 'dart:convert';

import 'package:http/http.dart';

import 'model.dart';

class Controller {
  Client client = Client();

  Controller([Client client]) {
    if (client != null) {
      this.client = client;
    } else {
      this.client = Client();
    }
  }

  Future<List<Pokemon>> getList() async {
    var request =
        await client.get("https://strong-thorn-planet.glitch.me/pokemon");

    List<dynamic> pokemon = jsonDecode(request.body);

    var pokemonList = pokemon.map((e) => Pokemon.fromJson(e)).toList();

    return pokemonList;
  }
}
