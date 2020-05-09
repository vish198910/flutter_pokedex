import 'package:injectable/injectable.dart';

import 'env.dart';

const stag = Environment('stag');

@stag
@preResolve
@singleton
@RegisterAs(Env)
class StagEnv extends Env {
  @override
  String get name => stag.name;

  @override
  String get parseAppId => '';

  @override
  String get parseServerUrl => '';

  @override
  String get parseClientKey => '';
}
