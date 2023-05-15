import 'package:flutter/material.dart';
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
            children: [
              SizedBox(height: 32),
              Text(
                'Sua lista de favoritos',
                style: PhoneplanetTextStyles.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
