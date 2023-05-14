class Product {
  String? image;
  String? name;
  String? subtitle;
  String? price;
  String? termPrice;
  bool? isFavorite;
  String? infos;

  Product({
    this.name,
    this.subtitle,
    this.price,
    this.termPrice,
    this.isFavorite,
    this.infos,
  });

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subtitle = json['subtitle'];
    price = json['price'];
    termPrice = json['termPrice'];
    isFavorite = json['isFavorite'];
    infos = json['infos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['subtitle'] = this.subtitle;
    data['price'] = this.price;
    data['termPrice'] = this.termPrice;
    data['isFavorite'] = this.isFavorite;
    data['infos'] = this.infos;
    return data;
  }
}
