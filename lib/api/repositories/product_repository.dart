import 'package:phoneplanet/api/models/product.dart';
import 'package:phoneplanet/api/service/service.dart';

const Map<String, dynamic> productMock = {
  'products': [
    {
      'image': 'https://d3ddx6b2p2pevg.cloudfront.net/Custom/Content/Products/10/97/1097084_smartphone-apple-iphone-13-pro-max-grafite-128gb_m3_637744691579753512.jpg',
      'name': 'Iphone 13 Pro Max',
      'subtitle': 'Novo na caixa',
      'price': 5500,
      'termPrice': 5800,
      'isFavorite': false,
    },
    {
      'image': 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MKU83_VW_34FR+watch-40-alum-midnight-nc-se_VW_34FR_WF_CO_GEO_BR?wid=1400&hei=1400&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1683237043713',
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
    for (Map<String, dynamic> item in response['products'] as List) {
      productList.add(Product.fromJson(item));
    }
    return productList;
  }
}
