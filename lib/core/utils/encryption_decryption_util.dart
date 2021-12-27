import 'package:encrypt/encrypt.dart';

class EncryptionDecryptionUtil {
  static getInstance({String masterKey}) => EncryptionDecryptionUtil._(masterKey: masterKey);

  final String masterKey;

  EncryptionDecryptionUtil._({this.masterKey}) {
    init();
  }
  Encrypter encrypter;

  init() {
    final key = Key.fromUtf8(createMasterKey(masterKey));
    encrypter = Encrypter(AES(key));
  }

  String encrypt(String text) {
    final iv = IV.fromUtf8(createMasterKey(masterKey));
    Encrypted encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String text) {
    final iv = IV.fromUtf8(createMasterKey(masterKey));
    var encrypted = Encrypted.from64(text);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  String createMasterKey(String text) {
    while (text.length < 16) {
      text += 'V';
    }
    print('length: ${text.length}');
    return text;
  }
}
