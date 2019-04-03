import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon.dart';

class Details extends StatefulWidget {
  final Pokemon pokemon;

  Details({this.pokemon});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Text(
                widget.pokemon.name,
                style:
                TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Text("Height: ${widget.pokemon.height}"),
              Text("Weight: ${widget.pokemon.weight}"),
              Text(
                "Types",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.pokemon.type
                    .map((t) => FilterChip(
                    backgroundColor: Colors.amber,
                    label: Text(t),
                    onSelected: (b) {}))
                    .toList(),
              ),
              Text("Weakness",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.pokemon.weaknesses
                    .map((t) => FilterChip(
                    backgroundColor: Colors.red,
                    label: Text(
                      t,
                      style: TextStyle(color: Colors.white),
                    ),
                    onSelected: (b) {}))
                    .toList(),
              ),
              Text("Next Evolution",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.pokemon.nextEvolution == null
                    ? <Widget>[Text("This is the final form")]
                    : widget.pokemon.nextEvolution
                    .map((n) => FilterChip(
                  backgroundColor: Colors.green,
                  label: Text(
                    n.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  onSelected: (b) {},
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
            tag: widget.pokemon.img,
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.pokemon.img))),
            )),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(
          widget.pokemon.name,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: bodyWidget(context),
    );
  }
}
