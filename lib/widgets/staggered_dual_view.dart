import 'package:flutter/material.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/models/fruit_model.dart';

class StaggeredDualView extends StatelessWidget {
  const StaggeredDualView({
    super.key,
    required this.fruits,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.65,
    this.spacing = 15,
    required this.itemBuilder,
    this.marginTop = 0.3,
  });

  final List<FruitModel> fruits;
  final int? crossAxisCount;
  final double? childAspectRatio;
  final double spacing;
  final Widget? Function(FruitModel fruit) itemBuilder;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constains) {
      double width = MediaQuery.of(context).size.width;
      double itemHeight = (width * 0.5) / childAspectRatio!;
      return GridView.builder(
        itemCount: fruits.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount!,
          childAspectRatio: childAspectRatio!,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        padding: EdgeInsets.only(
          top: spacing,
          right: spacing,
          left: spacing,
          bottom: fruits.length.isOdd
              ? spacing
              : spacing + (itemHeight * marginTop),
        ),
        itemBuilder: (context, index) {
          final fruit = fruits[index];

          return Transform.translate(
            offset: Offset(
              0.0,
              index.isOdd ? itemHeight * marginTop : 0,
            ),
            child: itemBuilder(fruit),
          );
        },
      );
    });
  }
}
