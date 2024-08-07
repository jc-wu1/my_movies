part of 'authentication_cubit.dart';

enum AuthStatus {
  unknown,
  authenticated,
  waiting,
  unauthenticated,
}

class AuthenticationState extends Equatable {
  final AuthStatus status;

  const AuthenticationState._({
    this.status = AuthStatus.unknown,
  });

  const AuthenticationState.authenticated()
      : this._(
          status: AuthStatus.authenticated,
        );

  const AuthenticationState.waiting()
      : this._(
          status: AuthStatus.waiting,
        );

  const AuthenticationState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [status];
}
