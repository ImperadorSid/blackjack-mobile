import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final int targetNumber;

  Game({this.targetNumber});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game')),
      body: Column(
        children: <Widget>[
          Text('${widget.targetNumber}'),
          Expanded(
            child:
                ListView.builder(itemBuilder: (context, index) => ListTile(
                  title: TextField(),
                  leading: Text('$index'),
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
