import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_cart/utils/api/network_info.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'app/db/drift/database.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  _initExternal();
  // _initCore();
  // _initFeatures();
}

void _initExternal() {
  sl.registerSingleton<NetworkInfo>(NetworkInfoImpl(Connectivity()));

  if (!kIsWeb) {
    // Register the database only if the platform is not web
    try {
      sl.registerSingleton<AppDatabase>(AppDatabase());
    } catch (e) {
      if (e is UnsupportedError) {
        print('Database connection is not supported on this platform.');
      } else {
        rethrow;
      }
    }
  } else {
    print('Skipping database registration on web platform.');
  }
}