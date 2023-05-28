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
}