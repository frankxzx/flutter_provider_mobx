// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$SettingsStore on SettingsBase, Store {
  final _$showPageAtom = Atom(name: 'SettingsBase.showPage');

  @override
  String get showPage {
    _$showPageAtom.reportObserved();
    return super.showPage;
  }

  @override
  set showPage(String value) {
    _$showPageAtom.context.checkIfStateModificationsAreAllowed(_$showPageAtom);
    super.showPage = value;
    _$showPageAtom.reportChanged();
  }

  final _$getPrefsDataAsyncAction = AsyncAction('getPrefsData');

  @override
  Future getPrefsData() {
    return _$getPrefsDataAsyncAction.run(() => super.getPrefsData());
  }

  final _$saveShowPageAsyncAction = AsyncAction('saveShowPage');

  @override
  Future saveShowPage(String showPage) {
    return _$saveShowPageAsyncAction.run(() => super.saveShowPage(showPage));
  }
}
