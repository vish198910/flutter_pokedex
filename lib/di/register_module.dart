import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:pokedex/env/env.dart';

@registerModule
abstract class RegisterModule {
  // Future<Parse> parse(Env env) async => Parse().initialize(
  //       env.parseAppId,
  //       env.parseServerUrl,
  //       clientKey: env.parseClientKey,
  //       coreStore: await CoreStoreSembastImp.getInstance(),
  //     );
}
