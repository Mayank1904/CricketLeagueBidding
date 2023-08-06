import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final String _keyToken = 'token';
  const AuthService(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future setToken(String token) async {
    await _secureStorage.write(key: _keyToken, value: token);
  }

  Future<String> getToken() async {
    final token = await _secureStorage.read(key: _keyToken);
    return 'Bearer $token';
  }

  Future<bool> isTokenValid() async {
    String? token = await _secureStorage.read(key: _keyToken);
    return token != null;
  }
}
