import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:pokedex/env/env.dart';

extension ParseX on Parse {
  Future<Parse> initWithEnviroment(Env env) async {
    return initialize(
      env.parseAppId,
      env.parseServerUrl,
      clientKey: env.parseClientKey,
      coreStore: await CoreStoreSembastImp.getInstance(),
    );
  }
}
