import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/local_models/media.dart';
import '../../../../core/shared/custom_app_bar.dart';
import '../../../../core/shared/loading_indicator.dart';
import '../../../../core/shared/vertical_listview_card.dart';
import '../../../../core/resources/app_values.dart';
import '../components/empty_favorite_text.dart';
import '../blocs/favorites_bloc/favorites_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<FavoritesBloc>(context)
        ..add(GetFavoriteItemsEvent()),
      child: const FavoritesView(),
    );
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Favorites",
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state.status == FavoritesRequestStatus.loading) {
            return const LoadingIndicator();
          } else if (state.status == FavoritesRequestStatus.loaded) {
            return WatchlistWidget(items: state.items);
          } else if (state.status == FavoritesRequestStatus.empty) {
            return const EmptyFavoriteText();
          } else {
            return const EmptyFavoriteText();
          }
        },
      ),
    );
  }
}

class WatchlistWidget extends StatelessWidget {
  const WatchlistWidget({
    super.key,
    required this.items,
  });

  final List<Media> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p6,
      ),
      itemBuilder: (context, index) {
        return VerticalListViewCard(media: items[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: AppSize.s10),
    );
  }
}
