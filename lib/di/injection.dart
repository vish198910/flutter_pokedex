import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../env/env.dart';
import 'injection.iconfig.dart';

final getIt = GetIt.instance;

@injectableInit
Future configureInjection(Env env) async =>
    $initGetIt(getIt, environment: env.name);
