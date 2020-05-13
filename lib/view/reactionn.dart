import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../config/appProperties.dart';
import '../serv_store/servStore.dart';

class Reactionn extends StatefulWidget {
  @override
  _ReactionnState createState() => _ReactionnState();
}

class _ReactionnState extends State<Reactionn> {
  final store = ServStore();

  List<ReactionDisposer> disposers;

  @override
  void initState() {
    disposers = [
      //OBSERVABLE TRACKED: are inside the 'Function Reaction'
      //ZERO: was not counted 'cause 'INITIALIZATION' is not included here
      reaction<bool>(
        (r) => store.contObsv % 2 == 0,
        (isEven) {
          if (isEven) {
            Flushbar(
                    title: 'Reaction ',
                    message:
                        'Run each OBSERVABLE TRACKED(${store.contObsv}) changing, FULLFILLING the \'Reaction condition(isEven - except ZERO because it is INITIALIZATION)\'',
                    duration: Duration(milliseconds: FLSB_TIME))
                .show(context);
          }
        },
      )
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
      appBar: AppBar(title: Text(TITLE_REACTIONN)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(child: Text(QUESTION_REACTIONN, textAlign: TextAlign.center)),
          Observer(
            builder: (BuildContext context) =>
                Text('${store.contObsv} buildObs', style: Theme.of(context).textTheme.headline3),
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
