import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'user_account.g.dart';

@Collection(ignore: {'props'})
class UserAccount extends Equatable {
  final Id? id;
  final String username;
  final String password;

  const UserAccount({
    this.id,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        password,
      ];
}
