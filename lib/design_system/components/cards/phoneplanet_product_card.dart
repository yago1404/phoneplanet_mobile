import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/components/buttons/phoneplanet_icon_button.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class PhoneplanetProductCard extends StatelessWidget {
  final String title;
  final String? label;
  final String? image;
  final num price;
  final bool isFavorite;
  final Function? onPressedCard;
  final Function? onPressedAdd;
  final Function? onPressedFavorite;

  const PhoneplanetProductCard({
    Key? key,
    required this.title,
    required this.price,
    this.label,
    this.image,
    this.onPressedCard,
    this.onPressedAdd,
    this.onPressedFavorite,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => onPressedCard?.call(),
          child: Container(
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
                image != null ? Image(
                  image: NetworkImage(
                    image!,
                  ),
                ) : Container(width: double.infinity),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: PhoneplanetTextStyles.smallTitle,
                ),
                const SizedBox(height: 4),
                if (label != null) Text(
                  label!,
                  style: PhoneplanetTextStyles.subtitle,
                ),
                const SizedBox(height: 12),
                Text(
                  'R\$ ${price.toStringAsFixed(2).replaceAll(',', '').replaceAll('.', ',')}',
                  style: PhoneplanetTextStyles.smallText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 8,
          child: PhoneplanetIconButton.primary(
            onPressed: () => onPressedAdd?.call(),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => onPressedFavorite?.call(),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? PhoneplanetColors.red : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
