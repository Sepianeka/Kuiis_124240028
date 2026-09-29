
class FormatUtils {
  static String formatNumber(double value, String unit) {
    // Menghilangkan .0 jika angka bulat
    String formatted = value % 1 == 0
        ? value.toInt().toString()
        : value.toString();
    return '$formatted $unit';
  }
}
