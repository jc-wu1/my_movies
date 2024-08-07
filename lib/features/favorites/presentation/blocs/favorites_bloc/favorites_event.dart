part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class GetFavoriteItemsEvent extends FavoritesEvent {
  @override
  List<Object?> get props => [];
}

class AddFavoriteItemEvent extends FavoritesEvent {
  final Media media;

  const AddFavoriteItemEvent({
    required this.media,
  });

  @override
  List<Object?> get props => [media];
}

class RemoveFavoriteItemEvent extends FavoritesEvent {
  final int index;

  const RemoveFavoriteItemEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class CheckFavoriteAddedEvent extends FavoritesEvent {
  final int tmdbId;

  const CheckFavoriteAddedEvent({
    required this.tmdbId,
  });

  @override
  List<Object?> get props => [tmdbId];
}
