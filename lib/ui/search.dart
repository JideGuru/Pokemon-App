import 'package:flutter/material.dart';

import 'package:pokemon_app/model/pokemon.dart';
import 'package:pokemon_app/ui/details.dart';

class PokeSearch extends SearchDelegate {


  final PokeHub pokeHub;
  PokeSearch({this.pokeHub});


  @override
  ThemeData appBarTheme(BuildContext context) {

    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if (query.length < 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than 1 character",
            ),
          )
        ],
      );
    }


    //Search in the json for the query entered
    var poko = pokeHub.pokemon.where(
            (pokee)=> pokee.name.contains(query)
    ).toList();

    return poko == null
        ? Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.cyan),
      ),
    ) : GridView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: poko == null ? 0 : poko.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int position){
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(
                        pokemon: poko[position],
                      )));
            },
            child: Hero(
              tag: poko[position].img,
              child: Card(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(poko[position].img))),
                    ),
                    Text(
                      poko[position].name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

//    if(pokeHub.pokemon.where((pokee)=> pokee.name.contains(query)=>print(pokee)).toList() == true)

    var poko = pokeHub.pokemon.where((pokee)=> pokee.name.contains(query)).toList();

    return poko == null
        ? Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.cyan),
      ),
    ) : GridView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: poko == null ? 0 : poko.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int position){
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(
                        pokemon: poko[position],
                      )));
            },
            child: Hero(
              tag: poko[position].img,
              child: Card(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(poko[position].img))),
                    ),
                    Text(
                      poko[position].name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

}