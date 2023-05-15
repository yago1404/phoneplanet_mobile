import 'package:flutter/material.dart';
import 'package:phoneplanet/app/shared/utils/phoneplanet_parser.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class PhoneplanetFavoriteCard extends StatelessWidget {
  final String image;
  final String title;
  final String? label;
  final num price;
  final Function? onTapFavorite;

  const PhoneplanetFavoriteCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    this.label,
    this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: PhoneplanetColors.lightGrey,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Image.network(image),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 8,
                      child: Text(
                        title,
                        style: PhoneplanetTextStyles.smallTitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      flex: 4,
                      child: Text(
                        PhoneplanetParser.parseToMoney(price),
                        style: PhoneplanetTextStyles.smallText.copyWith(
                          color: PhoneplanetColors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                if (label != null)
                  Text(
                    label!,
                    style: PhoneplanetTextStyles.smallText.copyWith(
                      color: PhoneplanetColors.grey,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 20,
            child: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
