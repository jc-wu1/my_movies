import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/local_models/user_account.dart';
import '../../../core/usecase/base_use_case.dart';
import '../domain/usecase/delete_auth_data.dart';
import '../domain/usecase/get_auth_token.dart';
import '../domain/usecase/save_auth_token.dart';

part 'authentication_state.dart';

/// A Cubit class for managing authentication state.
///
/// [AuthenticationCubit] handles user authentication operations,
/// such as login, logout, and checking authentication status.
class AuthenticationCubit extends Cubit<AuthenticationState> {
  /// Creates an instance of [AuthenticationCubit].
  ///
  /// [getAuthToken] - A function to retrieve the authentication token.
  /// [saveAuthToken] - A function to save the authentication token.
  /// [deleteAuthData] - A function to delete authentication data.
  AuthenticationCubit(
    this.getAuthToken,
    this.saveAuthToken,
    this.deleteAuthData,
  ) : super(const AuthenticationState.unauthenticated());

  /// Function to retrieve the authentication token.
  final GetAuthToken getAuthToken;

  /// Function to save the authentication token.
  final SaveAuthToken saveAuthToken;

  /// Function to delete authentication data.
  final DeleteAuthData deleteAuthData;

  /// Logs in a user by saving authentication data and emitting authenticated state.
  ///
  /// [authData] - The user account data to be saved as authentication token.
  void login(UserAccount authData) async {
    saveAuthToken(authData);

    emit(const AuthenticationState.authenticated());
  }

  /// Logs out the user by deleting authentication data and emitting unauthenticated state.
  void logout() async {
    deleteAuthData(const NoParameters());
    emit(const AuthenticationState.unauthenticated());
  }

  /// Checks the current authentication status and emits the appropriate state.
  ///
  /// This method simulates a delay to mimic checking authentication status.
  void checkAuth() async {
    emit(const AuthenticationState.waiting());

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        final authData = await getAuthToken(const NoParameters());

        await authData.fold(
          (l) async => emit(const AuthenticationState.unauthenticated()),
          (r) async {
            if (r == "julian") {
              return emit(const AuthenticationState.authenticated());
            } else {
              return emit(const AuthenticationState.unauthenticated());
            }
          },
        );
      },
    );
  }
}
