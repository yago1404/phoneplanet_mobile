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
                  children: const [
                    Expanded(
                      child: PhoneplanetProductCard(),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: PhoneplanetProductCard(),
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
                  children: const [
                    Expanded(
                      child: PhoneplanetProductCard(),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: PhoneplanetProductCard(),
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
