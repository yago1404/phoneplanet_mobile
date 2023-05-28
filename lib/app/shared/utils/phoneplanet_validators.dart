abstract class PhoneplanetValidators {
  static String? noNullableValidator(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo de email é obrigatório.';
    }
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, insira um email válido.';
    }
    return null;
  }

  static String? birthdayValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo de aniversário é obrigatório.';
    }
    final RegExp birthdayRegex = RegExp(
      r'^\d{2}/\d{2}/\d{4}$',
    );
    if (!birthdayRegex.hasMatch(value)) {
      return 'Por favor, insira uma data de aniversário válida no formato DD/MM/AAAA.';
    }
    num year = int.parse(value.substring(6, 10));
    if (DateTime.now().year - year < 18) {
      return 'É preciso ser maior de idade';
    }
    return null;
  }

  static String? cpfValidator(String? value) {
    String cpf = value!.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpf.length != 11) {
      return 'Digite um CPF válido';
    }
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
      return 'Digite um CPF válido';
    }
    List<int> numbers = cpf.split('').map(int.parse).toList();
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += numbers[i] * (10 - i);
    }
    int remainder = sum % 11;
    int firstDigit = remainder < 2 ? 0 : 11 - remainder;
    if (numbers[9] != firstDigit) {
      return 'Digite um CPF válido';
    }
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += numbers[i] * (11 - i);
    }
    remainder = sum % 11;
    int secondDigit = remainder < 2 ? 0 : 11 - remainder;

    if (numbers[10] != secondDigit) {
      return 'Digite um CPF válido';
    }

    return null;
  }
}