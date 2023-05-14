import 'package:phoneplanet/api/models/product.dart';
import 'package:phoneplanet/api/service/service.dart';

const Map<String, dynamic> productMock = {
  'products': [
    {
      'name': 'Iphone 13 Pro Max',
      'subtitle': 'Novo na caixa',
      'price': 5500,
      'termPrice': 5800,
      'isFavorite': false,
    },
    {
      'name': 'Apple Watch',
      'subtitle': 'Promoção',
      'price': 1100,
      'termPrice': 1200,
      'isFavorite': false,
    },
  ],
};

class ProductRepository {
  final IService service;

  const ProductRepository({required this.service});

  Future<List<Product>> getNewcomersProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Product> productList = [];
    Map<String, dynamic> response = /* await service.get('/products')*/
        productMock;
    for (Map<String, dynamic> item in response as List) {
      productList.add(Product.fromJson(item));
    }
    return productList;
  }
}
