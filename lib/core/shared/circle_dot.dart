import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_values.dart';

/// A stateless widget that represents a circular dot.
///
/// This widget creates a small circular dot with a specified size and color,
/// and adds horizontal padding around it.
class CircleDot extends StatelessWidget {
  const CircleDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
      child: Container(
        width: AppSize.s6,
        height: AppSize.s6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.circleDotColor,
        ),
      ),
    );
  }
}
