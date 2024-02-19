import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    StatefulColorfulTile(key: UniqueKey()),
    StatefulColorfulTile(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTile extends StatelessWidget {
  Color myColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor, child: Padding(padding: EdgeInsets.all(70.0)));
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({super.key});
  @override
  State<StatefulWidget> createState() => StatefulColorfulTileState();
}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color myColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: myColor,
        height: 70,
        width: 70,
        child: Padding(padding: EdgeInsets.all(70)),
      ),
    );
  }
}
