import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/router/app_router.dart';
import 'core/router/app_routes.dart';
import 'core/resources/app_strings.dart';
import 'core/resources/app_values.dart';
import 'features/authentication/bloc/authentication_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: AppStrings.movies,
            icon: Icon(
              Icons.movie_creation_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
              size: AppSize.s20,
            ),
          ),
        ],
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  /// Returns the index of the currently selected item based on the current route.
  ///
  /// This method uses the current route's location from the [GoRouterState] to determine
  /// which item is currently selected. It returns:
  /// - `0` if the location starts with [moviesPath],
  /// - `1` if the location starts with [profilePath],
  /// - `0` by default.
  ///
  /// Parameters:
  /// - [context]: The [BuildContext] used to retrieve the current route.
  ///
  /// Returns:
  /// - An [int] representing the index of the selected item.
  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(moviesPath)) {
      return 0;
    }
    if (location.startsWith(profilePath)) {
      return 1;
    }
    return 0;
  }

  /// Handles the tap action on a navigation item.
  ///
  /// This method performs navigation based on the selected index and the authentication status.
  /// - Navigates to the [moviesRoute] if the index is `0`.
  /// - Navigates to the [profileRoute] if the index is `1` and the user is authenticated.
  ///   Otherwise, navigates to the [loginRoute].
  ///
  /// Parameters:
  /// - [index]: The index of the tapped item.
  /// - [context]: The [BuildContext] used to perform navigation and access the [AuthenticationCubit].
  void _onItemTapped(int index, BuildContext context) {
    final authCubit = context.read<AuthenticationCubit>();

    final bool loggedIn = authCubit.state.status == AuthStatus.authenticated;

    switch (index) {
      case 0:
        context.goNamed(AppRoutes.moviesRoute);
        break;
      case 1:
        if (loggedIn) {
          context.goNamed(AppRoutes.profileRoute);
        } else {
          context.pushNamed(AppRoutes.loginRoute);
        }
        break;
      default:
        context.goNamed(AppRoutes.moviesRoute);
    }
  }
}
