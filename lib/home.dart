import 'package:flutter/material.dart';
import 'game.dart';
import 'player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Player> _playersList = [
    Player('sam'),
    Player('juh'),
    Player('keh')
  ];
  int _chosenNumber = 21;

  void addPlayer(String playerName) {
    setState(() => _playersList.add(Player(playerName)));
    Navigator.of(context).pop();
  }

  void removePlayer(int indexToRemove) =>
      setState(() => _playersList.removeAt(indexToRemove));

  ListTile playerRow(int playerIndex) => ListTile(
        title: Text('${_playersList[playerIndex].name}'),
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
        title: Text('Nome do jogador'),
        content:
            TextField(onChanged: (nameInputted) => playerName = nameInputted),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          FlatButton(
            onPressed: () => addPlayer(playerName),
            child: Text('Adicionar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blackjack')),
      body: Column(
        children: <Widget>[
          Text('Número-alvo'),
          TextField(
            onChanged: (valueInput) => _chosenNumber = int.parse(valueInput),
          ),
          Text('Jogadores'),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => playerRow(index),
              itemCount: _playersList.length,
            ),
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                onPressed: dialogInputPlayerName,
                child: Text('Adicionar jogadores'),
              ),
              RaisedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Game(
                              targetNumber: _chosenNumber,
                              players: _playersList,
                            ))),
                child: Text('Iniciar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
