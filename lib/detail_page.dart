import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sepokedex/model.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  DetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image(
              image: NetworkImage(
                  pokemon.image
              ),
              fit: BoxFit.cover,
              height: 200,
              width: 200,

            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(pokemon.name,
              style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 72),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(pokemon.description,
              style: Theme.of(context).textTheme.subtitle1,),
          ),
        ],
      ),
    );
  }
}