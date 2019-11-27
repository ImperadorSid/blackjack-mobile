enum PlayerStatus{
  playing,
  turn,
  lost,
  won
}

class Player{
  final String name;
  int points;
  PlayerStatus status;

  Player(String name) : this.name = name{
    this.points = 0;
    this.status = PlayerStatus.playing;
  }
}
