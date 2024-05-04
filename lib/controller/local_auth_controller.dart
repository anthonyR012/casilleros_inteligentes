import 'package:local_auth/local_auth.dart';

class LocalAuthController {
  static final _auth = LocalAuthentication();

  Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  Future<bool> authenticate() async {
    if (!await _canAuthenticate()) return false;
    return await _auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        options: const AuthenticationOptions(biometricOnly: true));
  }
}
