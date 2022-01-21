import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

export 'package:hive/hive.dart';

// ignore: constant_identifier_names
const STORAGE_KEY = 'LN5m2NVZtGdnbjmV';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();

    var encryptionKey = await getEncryptionKey();
    await Hive.openBox(
      HiveContants.authentication.name,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  static Future<Uint8List> getEncryptionKey() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    var key = await secureStorage.read(
      key: STORAGE_KEY,
    );

    if (key == null) {
      key = base64UrlEncode(Hive.generateSecureKey());
      await secureStorage.write(
        key: STORAGE_KEY,
        value: key,
      );
    }

    return base64Url.decode(key);
  }
}

enum HiveContants { authentication, refreshToken }