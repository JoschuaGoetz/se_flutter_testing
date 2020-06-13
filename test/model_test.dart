import 'package:flutter_test/flutter_test.dart';
import 'package:sepokedex/model.dart';

void main() async {
  Pokemon pokemon;

  setUp(() {
    print('I run before each and every test');
  });

  group('Bulbasaur', () {
    setUpAll(() {
      print('I run once at the start of the group');
    });

    setUp(() async {
      pokemon = Pokemon.fromJson({
        "description":
            "A strange seed was planted on its back at birth.\fThe plant sprouts and grows with this POKéMON.",
        "image":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
        "name": "bulbasaur",
        "types": ["Grass", "Poison"]
      });
      print('Setup test with pokemon ${pokemon.name}');
    });

    test('has the correct name', () async {
      expect(pokemon.name, equals('Bulbasaur'));
    });

    test('has the correct description', () async {
      expect(
          pokemon.description,
          equals(
              'A strange seed was planted on its back at birth.\fThe plant sprouts and grows with this POKéMON.'));
    });

    test('has the correct types', () async {
      expect(pokemon.type, equals(["Grass", "Poison"]));
    });
  });

  group('model', () {
    setUp(() async {
      pokemon = Pokemon(
          'rayQuAza',
          'teSt desCriptIon',
          'https://bulbapedia.bulbagarden.net/wiki/File:384Rayquaza.png',
          ['Dragon', 'Flying']);
      print('Setup test with pokemon ${pokemon.name}');
    });

    test('String.capitalize capitalizes the first letter', () async {
      expect(pokemon.name.capitalize(), equals('RayQuAza'));
    });

    test('String.capitalizeAll converts to title case', () async {
      expect(pokemon.description.capitalizeAll(), equals('TeSt DesCriptIon'));
    });
  });
}
