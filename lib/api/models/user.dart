class User {
  String? name;
  String? cpf;
  String? email;
  String? birthday;
  String? photo;
  String? refreshToken;
  int? id;

  User({
    this.name,
    this.cpf,
    this.email,
    this.birthday,
    this.photo,
    this.refreshToken,
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    email = json['email'];
    birthday = json['birthday'];
    photo = json['photo'];
    refreshToken = json['refreshToken'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cpf'] = cpf;
    data['email'] = email;
    data['birthday'] = birthday;
    data['photo'] = photo;
    data['refreshToken'] = refreshToken;
    data['id'] = id;
    return data;
  }
}
