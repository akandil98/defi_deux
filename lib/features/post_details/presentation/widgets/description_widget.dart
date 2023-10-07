import 'package:defi_deux/core/utils/utils.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  const DescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.s10,
      ),
      child: SizedBox(
        width: 0.7.sw,
        child: Text(
          description,
        ),
      ),
    );
  }
}
