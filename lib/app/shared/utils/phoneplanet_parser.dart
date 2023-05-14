abstract class PhoneplanetParser {
  static String parseToMoney(num value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll(',', '').replaceAll('.', ',')}';
  }
}