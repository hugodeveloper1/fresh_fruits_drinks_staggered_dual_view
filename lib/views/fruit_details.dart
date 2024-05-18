import 'package:flutter/material.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/models/fruit_model.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/widgets/custom_button.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/widgets/custom_card.dart';

class FruitDetails extends StatelessWidget {
  const FruitDetails({
    super.key,
    required this.fruit,
  });

  final FruitModel fruit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final marginHorizontal = size.width * 0.05;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            leading: IconButton(
              onPressed: () {},
              splashRadius: 18,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: Color(0xFF6C6C6C),
              ),
            ),
            title: Text('Smoothies'.toUpperCase()),
          ),
          CustomCard(
            margin: EdgeInsets.symmetric(
              horizontal: marginHorizontal,
              vertical: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textAndIcon(
                    context,
                    image: 'assets/delivery.png',
                    value: 'Delivery',
                  ),
                  _textAndIcon(
                    context,
                    image: 'assets/timer.png',
                    value: '50-60 mins',
                  ),
                  _textAndIcon(
                    context,
                    image: 'assets/location.png',
                    value: 'Live Tracking',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Hero(
                tag: fruit.image,
                child: Image.asset(
                  fruit.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          CustomCard(
            margin: EdgeInsets.symmetric(
              horizontal: marginHorizontal,
              vertical: 15,
            ),
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.06),
              child: Column(
                children: [
                  _Name(
                    name: fruit.name,
                    price: fruit.price,
                  ),
                  const SizedBox(height: 20),
                  _Information(),
                  const SizedBox(height: 20),
                  _Count(),
                  const SizedBox(height: 30),
                  CustomButton(
                    width: size.width,
                    value: 'Buy Now',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textAndIcon(
    BuildContext context, {
    required String image,
    required String value,
  }) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 14,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(width: 5),
        Text(
          value,
          style: textTheme.bodySmall!.copyWith(
            color: const Color(0xFF3A3A3A),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
    required this.name,
    required this.price,
  });

  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            name.toUpperCase(),
            style: textTheme.bodyMedium!.copyWith(
              fontSize: size.width * 0.065,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              '\$',
              style: textTheme.bodyMedium!.copyWith(
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 3),
            Text(
              price.toStringAsFixed(2),
              style: textTheme.bodyMedium!.copyWith(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w900,
                color: theme.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sizes',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                '500ml - \$7.00',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall,
              ),
              Text(
                '250ml - \$4.00',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                'In 50 Minutes',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Qty',
              style: textTheme.bodyMedium!.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFD9D9D9),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                  Text(
                    '1',
                    style: textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            'Add More',
            style: textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              color: theme.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
