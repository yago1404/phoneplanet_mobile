import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/components/buttons/phoneplanet_icon_button.dart';
import 'package:phoneplanet/design_system/components/buttons/phoneplanet_select_button.dart';
import 'package:phoneplanet/design_system/components/cards/phoneplanet_product_card.dart';
import 'package:phoneplanet/design_system/components/inputs/phoneplanet_search_bar.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Olá Claudio',
                          style: PhoneplanetTextStyles.title,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Oque você quer comprar hoje?',
                          style: PhoneplanetTextStyles.subtitle,
                        ),
                      ],
                    ),
                    const PhoneplanetIconButton(
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: PhoneplanetSearchBar(),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 24),
                    PhoneplanetSelectButton(
                      label: 'Iphone',
                      isSelected: selectedFilter == 1,
                      icon: Icon(
                        Icons.phone_iphone,
                        color:
                            selectedFilter != 1 ? Colors.black : Colors.white,
                      ),
                      onTap: () => setState(() {
                        selectedFilter = (selectedFilter != 1) ? 1 : null;
                      }),
                    ),
                    const SizedBox(width: 12),
                    PhoneplanetSelectButton(
                      label: 'Apple Watch',
                      isSelected: selectedFilter == 2,
                      icon: Icon(
                        Icons.watch,
                        color:
                            selectedFilter != 2 ? Colors.black : Colors.white,
                      ),
                      onTap: () => setState(() {
                        selectedFilter = (selectedFilter != 2) ? 2 : null;
                      }),
                    ),
                    const SizedBox(width: 12),
                    PhoneplanetSelectButton(
                      label: 'Ipad',
                      isSelected: selectedFilter == 3,
                      icon: Icon(
                        Icons.tablet_mac,
                        color:
                            selectedFilter != 3 ? Colors.black : Colors.white,
                      ),
                      onTap: () => setState(() {
                        selectedFilter = (selectedFilter != 3) ? 3 : null;
                      }),
                    ),
                    const SizedBox(width: 12),
                    PhoneplanetSelectButton(
                      label: 'Airpods',
                      isSelected: selectedFilter == 4,
                      icon: Icon(
                        Icons.headphones,
                        color:
                            selectedFilter != 4 ? Colors.black : Colors.white,
                      ),
                      onTap: () => setState(() {
                        selectedFilter = (selectedFilter != 4) ? 4 : null;
                      }),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Acabaram de chegar',
                      style: PhoneplanetTextStyles.title,
                    ),
                    Text(
                      'Ver todos',
                      style: PhoneplanetTextStyles.label.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: PhoneplanetProductCard(
                        image:
                            'https://d3ddx6b2p2pevg.cloudfront.net/Custom/Content/Products/10/97/1097084_smartphone-apple-iphone-13-pro-max-grafite-128gb_m3_637744691579753512.jpg',
                        title: 'Iphone 13 Pro Max',
                        label: 'Novo na caixa',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: PhoneplanetProductCard(
                        image:
                            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MKU83_VW_34FR+watch-40-alum-midnight-nc-se_VW_34FR_WF_CO_GEO_BR?wid=1400&hei=1400&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1683237043713',
                        title: 'Apple watch',
                        label: 'Promoção',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Favoritos da galera',
                      style: PhoneplanetTextStyles.title,
                    ),
                    Text(
                      'Ver todos',
                      style: PhoneplanetTextStyles.label.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: PhoneplanetProductCard(
                        image:
                            'https://d3ddx6b2p2pevg.cloudfront.net/Custom/Content/Products/10/97/1097084_smartphone-apple-iphone-13-pro-max-grafite-128gb_m3_637744691579753512.jpg',
                        title: 'Iphone 13 Pro Max',
                        label: 'Seminovo',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: PhoneplanetProductCard(
                        image:
                            'https://www.iplace.com.br/ccstore/v1/images/?source=/file/v1241423504693820270/products/219321.00-apple-ipad-9-geracao-wifi-cellular-256gb-cinzaespacial-mk4e3bz-a.jpg&height=475&width=475&height=470&width=470&quality=0.8',
                        title: 'Ipad 8',
                        label: 'Novo na caixa',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
