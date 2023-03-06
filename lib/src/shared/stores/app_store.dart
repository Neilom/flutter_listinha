import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  final ConfigurationService _configurationService;

  AppStore(this._configurationService);

  void init() {
    //TODO: salvar na base local;
  }

  void save() {
    //TODO: salvar na base local;
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }
}
