@TestOn('vm')

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' show Response;
import 'package:http/testing.dart';
import 'package:sepokedex/controller.dart';
import 'package:sepokedex/model.dart';

void main() async {
  Controller controller;
  MockClient mockClient;

  setUpAll(() async {
    mockClient = new MockClient((request) async {
      return Response(
          jsonEncode([
            {
              "description":
                  "A strange seed was planted on its back at birth.\fThe plant sprouts and grows with this POKéMON.",
              "image":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
              "name": "bulbasaur",
              "types": ["Grass", "Poison"]
            },
            {
              "description":
                  "When the bulb on its back grows large, it appears\fto lose the ability to stand on its hind legs.",
              "image":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
              "name": "ivysaur",
              "types": ["Grass", "Poison"]
            },
            {
              "description":
                  "The plant blooms when it is absorbing solar\fenergy. It stays on the move to seek sunlight.",
              "image":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
              "name": "venusaur",
              "types": ["Grass", "Poison"]
            },
            {
              "description":
                  "The fire on the tip of its tail is a measure of its life. If healthy, its tail burns intensely.",
              "image":
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
              "name": "charmander",
              "types": ["Fire"]
            }
          ]),
          123);
    });

    controller = Controller(mockClient);
  });

  group('getList', () {
    test('returns 4 pokemon', () async {
      List<Pokemon> pokemonList = await controller.getList();

      expect(pokemonList.length, equals(4));
    });

    test('returns a list', () async {
      List<Pokemon> pokemonList = await controller.getList();

      expect(pokemonList is List<Pokemon>, equals(true));
    });
  });
}
