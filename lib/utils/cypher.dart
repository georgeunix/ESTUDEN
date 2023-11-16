import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

import 'helpers.dart';

class Cypher {
  static final keyBytes = Key(Uint8List.fromList([212, 253, 73, 44, 141, 9, 55, 205, 129, 40, 219, 165, 202, 158, 20, 63, 254, 60, 81, 18, 160, 131, 17, 98, 217, 131, 172, 177, 236, 61, 102, 1]));
  static final ivBytes = IV(Uint8List.fromList([166, 153, 207, 203, 14, 28, 86, 94, 241, 31, 91, 112, 35, 173, 47, 17]));

  static Future<String> decryptFile() async {
    final encrypt = Encrypter(AES(keyBytes));
    final dataLoaded = await Helpers.readData();
    final decryptedContent = encrypt.decrypt(Encrypted.fromBase64(dataLoaded), iv: ivBytes);
    return Future(() => decryptedContent);
  }
}
