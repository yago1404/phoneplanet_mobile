import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/components/cards/phoneplanet_favorite_card.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              Text(
                'Sua lista de favoritos',
                style: PhoneplanetTextStyles.title,
              ),
              SizedBox(height: 24),
              PhoneplanetFavoriteCard(
                image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MKU83_VW_34FR+watch-40-alum-midnight-nc-se_VW_34FR_WF_CO_GEO_BR?wid=1400&hei=1400&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1683237043713',
                title: 'Apple Watch',
                price: 1200,
                label: 'Relógio inteligente para esportes e para o dia a dia.',
              ),
              SizedBox(height: 16),
              PhoneplanetFavoriteCard(
                image: 'https://d3ddx6b2p2pevg.cloudfront.net/Custom/Content/Products/10/97/1097084_smartphone-apple-iphone-13-pro-max-grafite-128gb_m3_637744691579753512.jpg',
                title: 'Iphone 14 Pro Max',
                price: 4000,
                label: 'Celular semi novo, unico dono. Sem marcas de uso, na cor cinza e com a bateria com 98%',
              ),
              SizedBox(height: 16),
              PhoneplanetFavoriteCard(
                image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MKU83_VW_34FR+watch-40-alum-midnight-nc-se_VW_34FR_WF_CO_GEO_BR?wid=1400&hei=1400&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1683237043713',
                title: 'Apple Watch',
                price: 1200,
                label: 'Relógio inteligente para esportes e para o dia a dia.',
              ),
              SizedBox(height: 16),
              PhoneplanetFavoriteCard(
                image: 'https://d3ddx6b2p2pevg.cloudfront.net/Custom/Content/Products/10/97/1097084_smartphone-apple-iphone-13-pro-max-grafite-128gb_m3_637744691579753512.jpg',
                title: 'Iphone 14 Pro Max',
                price: 4000,
                label: 'Celular semi novo, unico dono. Sem marcas de uso, na cor cinza e com a bateria com 98%',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
