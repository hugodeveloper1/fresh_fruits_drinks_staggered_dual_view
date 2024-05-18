import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.value = '',
    this.backgroundColor,
    this.onTap,
    this.width,
  });

  final String value;
  final double? width;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? theme.primaryColor,
        ),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
        shadowColor: const MaterialStatePropertyAll(Colors.black12),
        fixedSize: MaterialStatePropertyAll(Size(width!, 45)),
      ),
      clipBehavior: Clip.antiAlias,
      onPressed: onTap,
      child: Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
