import 'package:realm/realm.dart';
import 'model/configuration_model.dart';

LocalConfiguration config = Configuration.local(
  [
    ConfigurationModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
  path: './realm/realm.db',
);
