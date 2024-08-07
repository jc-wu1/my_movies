import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/features/favorites/presentation/blocs/favorites_bloc/favorites_bloc.dart';

import 'core/injector/injector.dart';
import 'core/router/app_router.dart';
import 'core/resources/app_strings.dart';
import 'core/resources/app_theme.dart';
import 'features/authentication/bloc/authentication_cubit.dart';
import 'features/authentication/domain/usecase/delete_auth_data.dart';
import 'features/authentication/domain/usecase/get_auth_token.dart';
import 'features/authentication/domain/usecase/save_auth_token.dart';
import 'features/watchlist/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';

class MyMoviesApp extends StatelessWidget {
  const MyMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(
            sl<GetAuthToken>(),
            sl<SaveAuthToken>(),
            sl<DeleteAuthData>(),
          )..checkAuth(),
        ),
        BlocProvider(
          create: (context) => WatchlistBloc(
            sl(),
            sl(),
            sl(),
            sl(),
          ),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(
            sl(),
            sl(),
            sl(),
            sl(),
          ),
        ),
      ],
      child: const MyMoviesAppView(),
    );
  }
}

class MyMoviesAppView extends StatelessWidget {
  const MyMoviesAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        router.refresh();
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: getApplicationTheme(),
        routerConfig: router,
      ),
    );
  }
}
