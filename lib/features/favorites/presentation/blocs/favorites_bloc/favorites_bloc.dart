import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/local_models/media.dart';
import '../../../../../core/usecase/base_use_case.dart';
import '../../../domain/usecases/add_favorite_item_usecase.dart';
import '../../../domain/usecases/check_if_favorite_item_added_usecase.dart';
import '../../../domain/usecases/get_favorite_items_usecase.dart';
import '../../../domain/usecases/remove_favorite_item_usecase.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

/// A [Bloc] that manages the state for favorite items.
///
/// This BLoC handles events related to fetching, adding, removing, and checking
/// favorite items. It uses various use cases to perform operations and emits
/// states accordingly.
///
/// Requires the following parameters:
/// - [GetFavoriteItemsUseCase] to retrieve favorite items.
/// - [AddFavoriteItemUseCase] to add an item to favorites.
/// - [RemoveFavoriteItemUseCase] to remove an item from favorites.
/// - [CheckIfFavoriteItemAddedUseCase] to check if an item is already in favorites.
///
/// Example usage:
/// ```dart
/// final favoritesBloc = FavoritesBloc(
///   getFavoriteItemsUseCase,
///   addFavoriteItemUseCase,
///   removeFavoriteItemUseCase,
///   checkIfFavoriteItemAddedUseCase,
/// );
/// ```
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  /// Creates an instance of [FavoritesBloc].
  ///
  /// Requires [GetFavoriteItemsUseCase], [AddFavoriteItemUseCase],
  /// [RemoveFavoriteItemUseCase], and [CheckIfFavoriteItemAddedUseCase] parameters.
  FavoritesBloc(
    this._getWatchListItemsUseCase,
    this._addWatchListItemUseCase,
    this._removeWatchListItemUseCase,
    this._checkIfItemAddedUseCase,
  ) : super(const FavoritesState()) {
    on<GetFavoriteItemsEvent>(_getFavoriteItems);
    on<AddFavoriteItemEvent>(_addFavoriteItem);
    on<RemoveFavoriteItemEvent>(_removeFavoriteItem);
    on<CheckFavoriteAddedEvent>(_checkFavoriteAdded);
  }

  /// Use case to retrieve favorite items.
  final GetFavoriteItemsUseCase _getWatchListItemsUseCase;

  /// Use case to add an item to favorites.
  final AddFavoriteItemUseCase _addWatchListItemUseCase;

  /// Use case to remove an item from favorites.
  final RemoveFavoriteItemUseCase _removeWatchListItemUseCase;

  /// Use case to check if an item is already in favorites.
  final CheckIfFavoriteItemAddedUseCase _checkIfItemAddedUseCase;

  /// Handles [GetFavoriteItemsEvent] by fetching favorite items and updating the state.
  ///
  /// Emits a loading state, then either:
  /// - An error state if the fetch fails, or
  /// - A loaded state with the retrieved items if successful, or
  /// - An empty state if no items are found.
  Future<void> _getFavoriteItems(
    FavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(
      const FavoritesState(
        status: FavoritesRequestStatus.loading,
      ),
    );
    try {
      final result = await _getWatchListItemsUseCase.call(const NoParameters());
      result.fold(
        (l) {
          emit(
            FavoritesState(
              status: FavoritesRequestStatus.error,
              message: l.message,
            ),
          );
        },
        (r) {
          if (r.isEmpty) {
            emit(
              const FavoritesState(
                status: FavoritesRequestStatus.empty,
              ),
            );
          } else {
            emit(
              FavoritesState(
                status: FavoritesRequestStatus.loaded,
                items: r,
              ),
            );
          }
        },
      );
    } catch (e) {
      emit(
        FavoritesState(
          status: FavoritesRequestStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  /// Handles [AddFavoriteItemEvent] by adding an item to favorites and updating the state.
  ///
  /// Emits a loading state, then either:
  /// - An error state if the addition fails, or
  /// - A state indicating the item was added successfully with the item's ID.
  Future<void> _addFavoriteItem(
    AddFavoriteItemEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(
      const FavoritesState(
        status: FavoritesRequestStatus.loading,
      ),
    );
    try {
      final result = await _addWatchListItemUseCase.call(event.media);
      result.fold(
        (l) {
          emit(
            FavoritesState(
              status: FavoritesRequestStatus.error,
              message: l.message,
            ),
          );
        },
        (r) {
          emit(
            FavoritesState(
              status: FavoritesRequestStatus.itemAdded,
              id: r,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        FavoritesState(
          status: FavoritesRequestStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  /// Handles [RemoveFavoriteItemEvent] by removing an item from favorites and updating the state.
  ///
  /// Emits a loading state, then either:
  /// - An error state if the removal fails, or
  /// - A state indicating the item was removed successfully.
  Future<void> _removeFavoriteItem(
    RemoveFavoriteItemEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(
      const FavoritesState(
        status: FavoritesRequestStatus.loading,
      ),
    );
    try {
      final result = await _removeWatchListItemUseCase.call(event.index);
      result.fold(
        (l) {
          emit(
            FavoritesState(
              status: FavoritesRequestStatus.error,
              message: l.message,
            ),
          );
        },
        (r) => emit(
          const FavoritesState(
            status: FavoritesRequestStatus.itemRemoved,
          ),
        ),
      );
    } catch (e) {
      emit(
        FavoritesState(
          status: FavoritesRequestStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  /// Handles [CheckFavoriteAddedEvent] by checking if an item is in favorites and updating the state.
  ///
  /// Emits a loading state, then either:
  /// - An error state if the check fails, or
  /// - A state indicating whether the item is added or not with the item's ID.
  FutureOr<void> _checkFavoriteAdded(
    CheckFavoriteAddedEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(
      const FavoritesState(
        status: FavoritesRequestStatus.loading,
      ),
    );
    try {
      final result = await _checkIfItemAddedUseCase.call(event.tmdbId);
      result.fold(
        (l) {
          emit(
            FavoritesState(
              status: FavoritesRequestStatus.error,
              message: l.message,
            ),
          );
        },
        (r) {
          emit(
            FavoritesState(
              status: FavoritesRequestStatus.isItemAdded,
              id: r,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        FavoritesState(
          status: FavoritesRequestStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
