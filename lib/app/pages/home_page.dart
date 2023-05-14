import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneplanet/api/api.dart';
import 'package:phoneplanet/app/shared/blocs/home_bloc/bloc.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeBloc>().add(LoadPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          state as Loaded;
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                      PhoneplanetIconButton(
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
                    children: [
                      for (Product product in state.newcomersProducts)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: product == state.newcomersProducts.last
                                  ? 0
                                  : 4,
                              left: product == state.newcomersProducts.last
                                  ? 4
                                  : 0,
                            ),
                            child: PhoneplanetProductCard(
                              title: product.name!,
                              price: product.price!,
                              label: product.subtitle,
                              image: product.image,
                              isFavorite: product.isFavorite,
                              onPressedFavorite: () => setState(() {
                                product.isFavorite = !(product.isFavorite ?? true);
                              }),
                            ),
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
                    children: [
                      for (Product product in state.favorites)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: product == state.favorites.last ? 0 : 4,
                              left: product == state.favorites.last ? 4 : 0,
                            ),
                            child: PhoneplanetProductCard(
                              title: product.name!,
                              price: product.price!,
                              image: product.image,
                              label: product.subtitle,
                              isFavorite: product.isFavorite,
                              onPressedFavorite: () => setState(() {
                                product.isFavorite = !(product.isFavorite ?? true);
                              }),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        }),
      ),
    );
  }
}
