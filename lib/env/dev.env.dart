import 'package:injectable/injectable.dart';

import 'env.dart';

@dev
@singleton
@RegisterAs(Env)
class DevEnv extends Env {
  @override
  String get name => dev.name;

  @override
  String get parseAppId => 'frE8zEjCmokPo63hMl9iQflcM9zeBW0Wq3U5Nu2T';

  @override
  String get parseServerUrl => 'https://parseapi.back4app.com';

  @override
  String get parseClientKey => 'kOAWVgBho3JO7YPKktVr9pCZOhylFGIPOkm9nmLr';
}
