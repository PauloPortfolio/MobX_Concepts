import 'package:mobx/mobx.dart';

part 'servStore.g.dart';

class ServStore = StoreInt with _$ServStore;

abstract class StoreInt with Store {

  @observable
  int contObsv = 0;

  @action
  void incrementAction() {
    contObsv++;
  }
}
//REBUILD: flutter packages pub run build_runner build
//WATCH: flutter packages pub run build_runner watch
//1) ERRORTYPE: "...This is likely because the`.dart_tool/...:
//----->SOLUTION: flutter packages pub run build_runner build --delete-conflicting-outputs
//2) ERRORTYPE: "...[SEVERE] source_gen:combining_builder...:
//----->SOLUTION:
//        a) delete darttool\ folder;
//        b) pubspec 'PUB GET'
//        c) flutter packages pub run build_runner build --delete-conflicting-outputs
//     ---d) Invalidate and Restart IDE (2x)
//     |
//     ---e) flutter packages pub run build_runner build (2x)
//        f) flutter packages pub run build_runner watch

