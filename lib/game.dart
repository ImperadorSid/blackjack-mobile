import 'package:flutter/material.dart';
import 'player.dart';

class Game extends StatefulWidget {
  final int targetNumber;
  final List<Player> players;

  Game({this.targetNumber, this.players});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.targetNumber}')),
        body: ListView.builder(
          itemBuilder: (context, playerIndex) =>
              ListTile(title: Text('${widget.players[playerIndex].name}'),trailing: Text('${widget.players[playerIndex].points}'),),
          itemCount: widget.players.length,
        ));
  }
}
