import 'package:flutter/material.dart';
import 'player.dart';

class Game extends StatefulWidget {
  final int targetNumber;
  final List<Player> players;

  Game({this.targetNumber, this.players}){
    this.players[0].status = PlayerStatus.turn;
  }

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  _GameState(){
    print(widget);
  }


  Color getPlayerColor(int index) {
    switch (widget.players[index].status) {
      case PlayerStatus.playing:
        return Colors.white;
      case PlayerStatus.turn:
        return Colors.green;
      case PlayerStatus.lost:
        return Colors.red;
      case PlayerStatus.won:
        return Colors.blue;
      default:
        return null;
    }
  }

  void addCard(cardValue){
    Player playingNow = widget.players.firstWhere((somePlayer) => somePlayer.status == PlayerStatus.turn);
    print(playingNow.name);
    setState(() {
      playingNow.points += cardValue;
      changePlayerTurn();
    });
    
  }

  int findNextSuitablePlayer(int actualPlayer){
    int possibleNextPlayer = actualPlayer;
    do {
      possibleNextPlayer = possibleNextPlayer + 1 == widget.players.length ? 0 : possibleNextPlayer + 1;
    } while (widget.players[possibleNextPlayer].status != PlayerStatus.playing);

    return possibleNextPlayer;
  }

  void changePlayerTurn(){
    Player playingNow = widget.players.firstWhere((somePlayer) => somePlayer.status == PlayerStatus.turn);
    int indexNextPlayer = findNextSuitablePlayer(widget.players.indexOf(playingNow));
    Player nextPlayer = widget.players[indexNextPlayer];

    setState(() {
      playingNow.status = PlayerStatus.playing;
      nextPlayer.status = PlayerStatus.turn;
    });
    
  }

  void checkWinOrLose(){
    // widget.players.for
  }

  @override
  Widget build(BuildContext context) {
    checkWinOrLose();
    
    return Scaffold(
        appBar: AppBar(title: Text('${widget.targetNumber}')),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, playerIndex) => ListTile(
                  title: Text(
                    '${widget.players[playerIndex].name}',
                    style: TextStyle(color: getPlayerColor(playerIndex)),
                  ),
                  trailing: Text('${widget.players[playerIndex].points}'),
                ),
                itemCount: widget.players.length,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 7,
                children: List.generate(
                  13,
                  (cardValue) => FlatButton(
                    onPressed: () => addCard(cardValue + 1),
                    child: Text('${cardValue + 1}'),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
