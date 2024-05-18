import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child, this.margin});

  final Widget child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.5, 3),
            blurRadius: 20,
          )
        ],
      ),
      child: child,
    );
  }
}
