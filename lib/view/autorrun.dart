import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../config/appProperties.dart';
import '../serv_store/servStore.dart';

class Autorrun extends StatefulWidget {
  @override
  _AutorrunState createState() => _AutorrunState();
}

class _AutorrunState extends State<Autorrun> {
  final store = ServStore();

  List<ReactionDisposer> disposers;

  @override
  void initState() {
    disposers = [
      //OBSERVABLE TRACKED: are inside the 'Function Autorun'
      //ZERO: was counted 'cause 'INITIALIZATION' is included here
      autorun((_) {
        print('Run in the INITIALIZATION(ZERO) AND each OBSERVABLE TRACKED(${store.contObsv}) changing after');
      })
    ];

    super.initState();
  }

  @override
  void dispose() {
    disposers.forEach((dispose) => dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('BuildHome');

    return Scaffold(
      appBar: AppBar(title: Text(TITLE_AUTORRUN)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(child: Text(QUESTION_AUTORRUN)),
          Observer(
            builder: (BuildContext context) =>
                Text('${store.contObsv}', style: Theme.of(context).textTheme.headline3),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.incrementAction,
        child: ICON_BUTTON,
      ),
    );
  }
}
