import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final int targetNumber;

  Game({this.targetNumber});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> players = [];

  void addPlayer(String playerName) {
    setState(() => players.add(playerName));
    Navigator.of(context).pop();
  }

  void removePlayer(int indexToRemove) =>
      setState(() => players.removeAt(indexToRemove));

  ListTile playerRow(int playerIndex) => ListTile(
        
        title: Text('${players[playerIndex]}'),
        trailing: FlatButton(
          onPressed: () => removePlayer(playerIndex),
          child: Icon(Icons.cancel),
        ),
      );

  void dialogInputPlayerName() {
    String playerName = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Player'),
        content:
            TextField(onChanged: (nameInputted) => playerName = nameInputted),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          FlatButton(
              onPressed: () => addPlayer(playerName), child: Text('Adicionar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(players);

    return Scaffold(
      appBar: AppBar(title: Text('${widget.targetNumber}')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => playerRow(index),
              itemCount: players.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: dialogInputPlayerName,
        child: Icon(Icons.add),
      ),
    );
  }
}
