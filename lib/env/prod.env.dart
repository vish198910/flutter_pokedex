import 'package:injectable/injectable.dart';

import 'env.dart';

@prod
@singleton
@RegisterAs(Env)
class ProdEnv extends Env {
  @override
  String get name => prod.name;

  @override
  String get parseAppId => '';

  @override
  String get parseServerUrl => '';

  @override
  String get parseClientKey => '';
}
