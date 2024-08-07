import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/bloc/authentication_cubit.dart';
import '../../features/favorites/presentation/views/favorites_page.dart';
import '../../features/login/display/login_page.dart';
import '../../features/movies/presentation/views/movie_details_view.dart';
import '../../features/movies/presentation/views/movies_view.dart';
import '../../features/movies/presentation/views/popular_movies_view.dart';
import '../../features/movies/presentation/views/top_rated_movies_view.dart';
import '../../features/profile/profile_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/watchlist/presentation/views/watchlist_page.dart';
import '../../home_page.dart';
import 'app_routes.dart';

const String moviesPath = '/movies';
const String movieDetailsPath = '/movies/:movieId';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';
const String watchlistPath = '/watchlist';
const String favoritesPath = '/favorites';
const String loginPath = '/login';
const String profilePath = '/profile';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

/// Defines the routes and navigation setup for the application.
///
/// This code sets up the routing configuration for the app using the `GoRouter`
/// package. It defines various routes, their paths, and the corresponding pages
/// to display. It also handles redirection based on authentication status and
/// provides keys for navigating between different navigators.
///
/// The `GoRouter` instance is configured with the following routes:
///
/// - `/splash`: The initial route that shows the splash screen. Redirects based
///   on authentication status to either the login page or the movies page.
/// - `/movies`: A shell route that contains routes for movie-related views.
///   - `/popularMovies`: Shows the popular movies view.
///   - `/topRatedMovies`: Shows the top-rated movies view.
/// - `/profile`: Displays the profile page. Redirects to the movies page if the
///   user is logged out.
/// - `/watchlist`: Shows the watchlist page.
/// - `/favorites`: Shows the favorites page.
/// - `/login`: Displays the login page. Redirects to the movies page if the user
///   is already logged in.
/// - `/movies/:movieId`: Displays the details of a specific movie based on the
///   provided `movieId` parameter.
///
/// Constants:
/// - `moviesPath`: Path for the movies route.
/// - `movieDetailsPath`: Path for the movie details route with a movie ID parameter.
/// - `popularMoviesPath`: Path for the popular movies route.
/// - `topRatedMoviesPath`: Path for the top-rated movies route.
/// - `watchlistPath`: Path for the watchlist route.
/// - `favoritesPath`: Path for the favorites route.
/// - `loginPath`: Path for the login route.
/// - `profilePath`: Path for the profile route.
///
/// Global keys:
/// - `rootNavigatorKey`: Key for the root navigator.
/// - `shellNavigatorKey`: Key for the shell navigator.
///
/// The `router` instance of `GoRouter` is configured to use the following:
/// - `debugLogDiagnostics`: Enables debug logging for route diagnostics.
/// - `initialLocation`: Specifies the initial route as `/splash`.
/// - `navigatorKey`: The key used for the root navigator.
/// - `routes`: The list of routes configured for the application.
GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: 'splash',
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return SplashPage(
          key: state.pageKey,
        );
      },
      redirect: (context, state) {
        // final authStatus = authenticationCubit.state;

        final authStatus = context.read<AuthenticationCubit>().state;

        if (authStatus.status == AuthStatus.waiting) {
          return null;
        }

        if (authStatus.status == AuthStatus.unauthenticated) {
          return loginPath;
        }

        if (authStatus.status == AuthStatus.authenticated) {
          return moviesPath;
        }

        return null;
      },
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          name: AppRoutes.moviesRoute,
          path: moviesPath,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MoviesView(),
          ),
          routes: [
            GoRoute(
              parentNavigatorKey: shellNavigatorKey,
              name: AppRoutes.popularMoviesRoute,
              path: popularMoviesPath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PopularMoviesView(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: shellNavigatorKey,
              name: AppRoutes.topRatedMoviesRoute,
              path: topRatedMoviesPath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TopRatedMoviesView(),
              ),
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.profileRoute,
          path: profilePath,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ProfilePage(),
          ),
          redirect: (context, state) {
            final loggedOut =
                context.read<AuthenticationCubit>().state.status ==
                    AuthStatus.unauthenticated;

            final bool loggingOut = state.location == profilePath;

            if (!loggedOut) {
              return loggingOut ? null : profilePath;
            }

            if (loggingOut) {
              return moviesPath;
            }

            return null;
          },
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: AppRoutes.watchlistRoute,
      path: watchlistPath,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: WatchlistPage(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: AppRoutes.favoritesRoute,
      path: favoritesPath,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: FavoritesPage(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: AppRoutes.loginRoute,
      path: loginPath,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage(
          key: state.pageKey,
        );
      },
      redirect: (context, state) {
        final loggedIn = context.read<AuthenticationCubit>().state.status ==
            AuthStatus.authenticated;

        final bool loggingIn = state.location == loginPath;

        if (!loggedIn) {
          return loggingIn ? null : loginPath;
        }

        if (loggingIn) {
          return moviesPath;
        }

        return null;
      },
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: AppRoutes.movieDetailsRoute,
      path: movieDetailsPath,
      pageBuilder: (context, state) => NoTransitionPage(
        child: MovieDetailPage(
          movieId: int.parse(state.params['movieId']!),
        ),
      ),
    ),
  ],
);
