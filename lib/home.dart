import 'package:flutter/material.dart';
import 'game.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _chosenNumber = 0;

    return Scaffold(
      appBar: AppBar(title: Text('Número-alvo')),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (valueInput) => _chosenNumber = int.parse(valueInput),
            // onChanged: (valueInput) => print(int.parse(valueInput)),
          ),
          RaisedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Game(targetNumber: _chosenNumber))),
            child: Text('Iniciar'),
          )
        ],
      ), 
    );
  }
}
