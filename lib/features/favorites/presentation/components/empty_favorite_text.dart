import 'package:flutter/material.dart';

import '../../../../core/resources/app_values.dart';

class EmptyFavoriteText extends StatelessWidget {
  const EmptyFavoriteText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Favorite(s) is empty",
            style: textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p6),
            child: Text(
              "After liking a movie, they will appear here",
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
