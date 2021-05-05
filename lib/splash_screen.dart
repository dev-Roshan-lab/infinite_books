import 'package:flutter/material.dart';
import 'dart:async';
import 'package:open_book/search.dart';

class load extends StatefulWidget {
  @override
  _loadState createState() => _loadState();
}

class _loadState extends State<load> {

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => search()),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'infinity',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('B', style: TextStyle(color: Colors.black, fontSize: 40),),
              Text('\u221E', style: TextStyle(color: Colors.yellow[800], fontSize: 40),),
              Text('ks', style: TextStyle(color: Colors.black, fontSize: 40))
            ],
          ),
        )
      ),
    );
  }
}
