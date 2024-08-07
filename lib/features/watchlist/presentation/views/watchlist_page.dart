import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/local_models/media.dart';
import '../../../../core/shared/custom_app_bar.dart';
import '../../../../core/shared/loading_indicator.dart';
import '../../../../core/shared/vertical_listview_card.dart';
import '../../../../core/resources/app_strings.dart';
import '../../../../core/resources/app_values.dart';
import '../components/empty_watchlist_text.dart';
import '../blocs/watchlist_bloc/watchlist_bloc.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<WatchlistBloc>(context)
        ..add(
          GetWatchListItemsEvent(),
        ),
      child: const WatchlistView(),
    );
  }
}

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.watchlist,
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          if (state.status == WatchlistRequestStatus.loading) {
            return const LoadingIndicator();
          } else if (state.status == WatchlistRequestStatus.loaded) {
            return WatchlistWidget(items: state.items);
          } else if (state.status == WatchlistRequestStatus.empty) {
            return const EmptyWatchlistText();
          } else {
            return const EmptyWatchlistText();
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
