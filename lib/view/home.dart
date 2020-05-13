import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testemobix/config/appProperties.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(TITLE_HOME)),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(QUESTION_GERAL, style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 30),
          RaisedButton(
              onPressed: () => Modular.to.pushNamed(AUTORRUN),
              child: const Text('AutoRun', style: TextStyle(fontSize: 20))),
          const SizedBox(height: 30),
          RaisedButton(
              onPressed: () => Modular.to.pushNamed(REACTIONN),
              child: const Text('Reactionn', style: TextStyle(fontSize: 20))),
          const SizedBox(height: 30),
          RaisedButton(
              onPressed: () => Modular.to.pushNamed(WHENN),
              child: const Text('Whenn', style: TextStyle(fontSize: 20))),
        ])));
  }
}
