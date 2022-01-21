import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() async {
  //getIt.registerSingleton<AuthTokenService>(AuthTokenService());

  await getIt.allReady();
}