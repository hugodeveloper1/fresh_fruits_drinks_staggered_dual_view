import 'package:flutter/material.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/models/fruit_model.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/widgets/custom_card.dart';

class FruitCard extends StatelessWidget {
  const FruitCard({
    super.key,
    required this.fruit,
    required this.onTap,
  });

  final FruitModel fruit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return CustomCard(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 12,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          fruit.price.toStringAsFixed(2),
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.black,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Hero(
                      tag: fruit.image,
                      child: Image.asset(
                        fruit.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Text(
                  fruit.name.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
