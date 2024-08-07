part of 'favorites_bloc.dart';

enum FavoritesRequestStatus {
  empty,
  loading,
  loaded,
  error,
  itemAdded,
  itemRemoved,
  isItemAdded,
}

class FavoritesState extends Equatable {
  const FavoritesState({
    this.id,
    this.items = const [],
    this.status = FavoritesRequestStatus.loading,
    this.message = '',
  });

  final int? id;
  final List<Media> items;
  final FavoritesRequestStatus status;
  final String message;

  FavoritesState copyWith({
    int? id,
    List<Media>? items,
    FavoritesRequestStatus? status,
    String? message,
  }) {
    return FavoritesState(
      id: id ?? this.id,
      items: items ?? this.items,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        id,
        items,
        status,
        message,
      ];
}
