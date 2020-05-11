import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../config/appProperties.dart';
import '../serv_store/servStore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //instancia o service_store, dever ser feito em DI
  final store = ServStore();

  //Lista de reactions, que e coletada, para ao fechar a view,
  //ser disposada
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    disposers = [

      // REACTION 01: EXECUCAO MULTIPLA C/ "DEPENDENCIA DE DISPOSE"
      reaction<int>((fn) => store.contObsv, (contagem) {
        String msg = "";
        if (contagem % 2 == 0) {
          msg = "PAR";
        } else {
          msg = "IMPAR";
        }
        Flushbar(
                title: msg,
                message: "${msg}: Condicao e depois",
                duration: Duration(milliseconds: 700))
            .show(context);
      }),

      // REACTION 02: EXECUCAO UNICA C/ "AUTO DISPOSE"
      // RETORNA 'BOOLEANA'
//      when(
//          (r) => store.contObsv >= 10,
//          () => Flushbar(
//                  icon: Icon(Icons.notifications_active),
//                  title: "Opa",
//                  message: "E' maior ou igual ao NUMERO 10!!!",
//                  duration: Duration(milliseconds: 700))
//              .show(context)),

    ];

    super.initState();
  }

//  @override
  void dispose() {
    //DISPOSANDO A "REACTION 01" QUE POSSUI "DEPENDENCIA DE DISPOSE"
    disposers.forEach((dispose) => dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('BuildHome');

    return Scaffold(
      appBar: AppBar(title: Text(TITLE_APP)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(QUESTION),
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
