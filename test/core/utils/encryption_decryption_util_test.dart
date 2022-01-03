import 'package:flutter_test/flutter_test.dart';
import 'package:smart_password_clean_architecture/core/utils/encryption_decryption_util.dart';

void main() {
  test('should return same text', () async {
    String plainText = 'A boy eat a Cat';

    String cyperText = EncryptionDecryptionUtil.getInstance(masterKey: 'asdf')
        .encrypt(plainText);
    String decyptedText =
        EncryptionDecryptionUtil.getInstance(masterKey: 'asdf')
            .decrypt(cyperText);

    expect(plainText, decyptedText);
  });
}
