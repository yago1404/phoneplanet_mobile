class Product {
  String? image;
  String? name;
  String? subtitle;
  String? infos;
  num? termPrice;
  num? price;
  bool? isFavorite;
  bool? isSelected;

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
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['subtitle'] = subtitle;
    data['price'] = price;
    data['termPrice'] = termPrice;
    data['isFavorite'] = isFavorite;
    data['infos'] = infos;
    data['image'] = image;
    return data;
  }
}
