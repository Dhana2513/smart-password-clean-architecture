import 'package:encrypt/encrypt.dart';

class EncryptionDecryptionUtil {
  static EncryptionDecryptionUtil getInstance({String masterKey}) =>
      EncryptionDecryptionUtil._(masterKey: masterKey);

  final String masterKey;

  EncryptionDecryptionUtil._({this.masterKey}) {
    init();
  }
  Encrypter encrypter;
  var iv;

  init() {
    var key;
    key = Key.fromUtf8(createMasterKey(key: masterKey ?? ''));
    iv = IV.fromUtf8(createMasterKey(key: masterKey ?? ''));
    encrypter = Encrypter(AES(key));
  }

  String encrypt(String text) {
    Encrypted encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String text) {
    var encrypted = Encrypted.from64(text);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  String createMasterKey({String key = ''}) {
    //create 128/192/256 bit key as cyper key.
    //Have created the 16 byte = 128 bit cyper key.
    while (key.length < 16) {
      key += 'V';
    }
    return key;
  }
}
