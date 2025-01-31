import 'package:intl/intl.dart';

class Utils {
  static String formatAmount(int amount) {
    final formatter = NumberFormat("#,###", "de_DE");
    return formatter.format(amount);
  }
}
