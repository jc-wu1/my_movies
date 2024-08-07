import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../resources/app_values.dart';

/// A custom app bar widget that implements [PreferredSizeWidget].
///
/// This widget creates an app bar with a specified title. If the current
/// navigation stack can be popped, it displays a back button on the leading edge.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates an instance of [CustomAppBar].
  ///
  /// The [title] parameter is required and specifies the title of the app bar.
  const CustomAppBar({
    super.key,
    required this.title,
  });

  /// The title to be displayed in the app bar.
  final String title;

  /// The preferred size of the app bar.
  ///
  /// This overrides the preferred size from [PreferredSizeWidget] to set a
  /// fixed height for the app bar.
  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      foregroundColor: Colors.white,
      leading: context.canPop()
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: AppSize.s20,
              ),
            )
          : null,
    );
  }
}
