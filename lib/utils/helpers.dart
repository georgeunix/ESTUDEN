import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

import 'constants.dart';

class Helpers {

  static Future<String> readData() async {
    return await rootBundle.loadString(Constants.path);
  }

  static String formatDate(String format, DateTime dateTime) {
    return DateFormat(format).format(dateTime).toString();
  }
}