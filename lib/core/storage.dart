import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tranzact/core/extensions.dart';

class Storage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static bool? _isOnBoardingDone;

  Storage._();

  static Future<bool> get isOnBoardingDone async {
    final value = await _storage.read(key: 'isOnBoardingDone');
    _isOnBoardingDone ??= (value == null) ? false : value.toBool();
    return _isOnBoardingDone!;
  }

  static setToken(bool value) async {
    await _storage.write(key: 'isOnBoardingDone', value: value.toString());
  }
}
