// extends from MainModule
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:testemobix/view/autorrun.dart';
import 'package:testemobix/view/home.dart';
import 'package:testemobix/view/reactionn.dart';
import 'package:testemobix/view/whenn.dart';

import '../app_driver.dart';
import 'appProperties.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(HOME, child: (_, args) => Home()),
        Router(AUTORRUN, child: (_, args) => Autorrun()),
        Router(REACTIONN, child: (_, args) => Reactionn()),
        Router(WHENN, child: (_, args) => Whenn()),
      ];

  @override
  Widget get bootstrap => AppDriver();
}
