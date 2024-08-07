import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_values.dart';
import '../../core/router/app_routes.dart';
import '../authentication/bloc/authentication_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          children: [
            const SizedBox(
              width: 120,
              height: 120,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 48,
                ),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state.status == AuthStatus.authenticated) {
                  return Text(
                    "Julian",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white),
                  );
                }
                return Text(
                  "Guess",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                );
              },
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            /// -- MENU
            ProfileMenuWidget(
              icon: const Icon(Icons.movie_creation),
              title: "Watchlist",
              onPress: () {
                context.pushNamed(AppRoutes.watchlistRoute);
              },
            ),
            ProfileMenuWidget(
              icon: const Icon(Icons.favorite),
              title: "Favorite Movies",
              onPress: () {
                context.pushNamed(AppRoutes.favoritesRoute);
              },
            ),

            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
              icon: const Icon(Icons.info),
              title: "Information",
              onPress: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog.adaptive(
                    icon: const Icon(Icons.warning_amber),
                    content: const Text(
                      "MyMovies v0.1.0 alpha\n-------\n*Known Bugs*\n- You might encounter a bugs where adding a movie to the watchlist or favorites will add it twice, so you need to click multiple times.\n\nJulianC",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'OK',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            ProfileMenuWidget(
              icon: const Icon(Icons.logout),
              title: "Logout",
              textColor: Colors.red,
              endIcon: false,
              onPress: () {
                context.read<AuthenticationCubit>().logout();
                context.goNamed(AppRoutes.moviesRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    this.icon,
  });

  final String title;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: icon,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.chevron_right,
                size: 18.0,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
