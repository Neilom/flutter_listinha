import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appStore = Modular.get<AppStore>();

  void _changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode = mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.select(
      () => appStore.themeMode,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: appStore.themeMode,
              title: Text('Sistema'),
              onChanged: _changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: appStore.themeMode,
              title: Text('Claro'),
              onChanged: _changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode,
              title: Text('Escuro'),
              onChanged: _changeThemeMode,
            ),
            SizedBox(height: 20),
            Text(
              'Controle de Dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: Text('Apagar cache e reiniciar o app'),
            )
          ],
        ),
      ),
    );
  }
}
