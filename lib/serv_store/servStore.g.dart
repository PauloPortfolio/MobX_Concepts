// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServStore on StoreInt, Store {
  final _$contObsvAtom = Atom(name: 'StoreInt.contObsv');

  @override
  int get contObsv {
    _$contObsvAtom.context.enforceReadPolicy(_$contObsvAtom);
    _$contObsvAtom.reportObserved();
    return super.contObsv;
  }

  @override
  set contObsv(int value) {
    _$contObsvAtom.context.conditionallyRunInAction(() {
      super.contObsv = value;
      _$contObsvAtom.reportChanged();
    }, _$contObsvAtom, name: '${_$contObsvAtom.name}_set');
  }

  final _$StoreIntActionController = ActionController(name: 'StoreInt');

  @override
  void incrementAction() {
    final _$actionInfo = _$StoreIntActionController.startAction();
    try {
      return super.incrementAction();
    } finally {
      _$StoreIntActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'contObsv: ${contObsv.toString()}';
    return '{$string}';
  }
}
