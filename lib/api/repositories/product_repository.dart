import 'package:phoneplanet/api/models/product.dart';
import 'package:phoneplanet/api/service/service.dart';

class ProductRepository {
  final IService service;

  const ProductRepository({required this.service});

  Future<Product> getAllProducts() async {
    Map<String, dynamic> response = await service.get('/products');
    return Product.fromJson(response);
  }
}