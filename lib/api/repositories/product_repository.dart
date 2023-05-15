import 'package:phoneplanet/api/models/product.dart';
import 'package:phoneplanet/api/service/service.dart';

const Map<String, dynamic> newcomersMock = {
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

const Map<String, dynamic> favoritesMock = {
  'products': [
    {
      'image': 'https://d3ddx6b2p2pevg.cloudfront.net/Custom/Content/Products/10/97/1097084_smartphone-apple-iphone-13-pro-max-grafite-128gb_m3_637744691579753512.jpg',
      'name': 'Iphone 12',
      'subtitle': 'Novo na caixa',
      'price': 3000.50,
      'termPrice': 3200,
      'isFavorite': false,
    },
    {
      'image': 'https://www.iplace.com.br/ccstore/v1/images/?source=/file/v1241423504693820270/products/219321.00-apple-ipad-9-geracao-wifi-cellular-256gb-cinzaespacial-mk4e3bz-a.jpg&height=475&width=475&height=470&width=470&quality=0.8',
      'name': 'Ipad',
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
        newcomersMock;
    for (Map<String, dynamic> item in response['products'] as List) {
      productList.add(Product.fromJson(item));
    }
    return productList;
  }

  Future<List<Product>> getFavorites() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Product> productList = [];
    Map<String, dynamic> response = /* await service.get('/favorites')*/
        favoritesMock;
    for (Map<String, dynamic> item in response['products'] as List) {
      productList.add(Product.fromJson(item));
    }
    return productList;
  }
}
