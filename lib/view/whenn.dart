import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../config/appProperties.dart';
import '../serv_store/servStore.dart';

class Whenn extends StatefulWidget {
  @override
  _WhennState createState() => _WhennState();
}

class _WhennState extends State<Whenn> {
  final store = ServStore();

  @override
  void initState() {

    //AUTO-DISPOSABLE: ONE-TIME REACTION IN THE CONDITION
    //REGARDLESS THE `WHEN CONDITION` WILL BE FULLFILLED AGAIN

    //OBSERVABLE TRACKED: are inside the 'Function When'
    when((_) => store.contObsv >= 5, () {
      print('This is greater than 05.');
      Flushbar(
              title: 'When: ONE-TIME REACTION - AUTODISPOSABLE',
              message: 'Run when the OBSERVABLE TRACKED(${store.contObsv}) changes and it is greater then 05(\'Condition\')',
              duration: Duration(milliseconds: FLSB_TIME))
          .show(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('BuildHome');

    return Scaffold(
      appBar: AppBar(title: Text(TITLE_WHENN)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(child: Text(QUESTION_WHENN, textAlign: TextAlign.center)),
          Observer(
            builder: (BuildContext context) =>
                Text('${store.contObsv} buildObs', style: Theme.of(context).textTheme.headline3),
          )
        ]),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: store.incrementAction,
          child: ICON_BUTTON,

        ),
      ),
    );
  }
}
