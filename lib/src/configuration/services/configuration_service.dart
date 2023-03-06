import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/services/realm/model/configuration_model.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class ConfigurationService {
  void init();
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService, Disposable {
  final Realm realm;
  final AppStore appStore;
  late final RxDisposer disposer;

  ConfigurationServiceImpl(this.realm, this.appStore);

  @override
  void init() {
    final model = _getconfiguration();
    appStore.themeMode = _getThemeModeByName(model.themeModeName);
    appStore.syncDate = model.syncDate;

    disposer = rxObserver(() {
      final themeMode = appStore.themeMode;
      final syncDate = appStore.syncDate;

      _saveConfiguration(themeMode.name, syncDate);
    });
  }

  @override
  void dispose() {
    disposer();
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  @override
  ConfigurationModel _getconfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void _saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = _getconfiguration();
    realm.write(() {
      model.themeModeName = themeModeName;
      model.syncDate = syncDate;
    });
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((element) => element.name == name);
  }
}
