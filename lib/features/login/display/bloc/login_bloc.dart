import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/local_models/user_account.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../authentication/bloc/authentication_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

/// A Bloc that handles user login events and manages the login state.
///
/// The [LoginBloc] class is responsible for processing login requests,
/// interacting with the [AuthenticationCubit] to perform authentication,
/// and emitting the appropriate [LoginState] based on the outcome of the login process.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// Creates an instance of [LoginBloc].
  ///
  /// [authCubit] - The [AuthenticationCubit] instance used to handle authentication logic.
  LoginBloc(
    this.authCubit,
  ) : super(const LoginInitial()) {
    on<LoginUserEvent>(_onLoginUserEvent);
  }

  final AuthenticationCubit authCubit;

  /// Handles the [LoginUserEvent] event.
  ///
  /// This method processes login requests, verifies user credentials,
  /// and emits the corresponding [LoginState].
  ///
  /// [event] - The [LoginUserEvent] containing the login credentials.
  /// [emit] - The [Emitter] used to emit the new [LoginState].
  Future<void> _onLoginUserEvent(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());
    try {
      var userAccount = UserAccount(
        username: event.email,
        password: event.password,
      );
      if (event.email == 'julian' && event.password == 'julian_test') {
        authCubit.login(
          userAccount,
        );
        emit(LoginSucceed(userAccount));
      } else {
        emit(
          const LoginFailure(
            ErrorMessageModel(
              success: false,
              statusCode: 400,
              statusMessage: "Incorrect username or password!",
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        LoginFailure(
          ErrorMessageModel(
            success: false,
            statusCode: 500,
            statusMessage: "Error ${e.toString()}",
          ),
        ),
      );
    }
  }
}
