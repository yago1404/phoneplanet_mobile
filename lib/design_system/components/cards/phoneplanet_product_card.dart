import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/components/buttons/phoneplanet_icon_button.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class PhoneplanetProductCard extends StatelessWidget {
  const PhoneplanetProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: PhoneplanetColors.lightGrey,
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: NetworkImage(
                  'https://d3ddx6b2p2pevg.cloudfront.net/Custom/Content/Products/10/97/1097084_smartphone-apple-iphone-13-pro-max-grafite-128gb_m3_637744691579753512.jpg',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Iphone 13',
                style: PhoneplanetTextStyles.smallTitle,
              ),
              const SizedBox(height: 4),
              const Text(
                'Novo na caixa',
                style: PhoneplanetTextStyles.subtitle,
              ),
              const SizedBox(height: 12),
              Text(
                'R\$ 3.400,00',
                style: PhoneplanetTextStyles.smallText.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 8,
          child: PhoneplanetIconButton.primary(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
