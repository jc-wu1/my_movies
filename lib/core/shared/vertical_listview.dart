import 'package:flutter/material.dart';

import '../resources/app_values.dart';

/// A [StatefulWidget] that displays a vertically scrolling list with load-on-scroll functionality.
///
/// This widget displays a list of items where more items are loaded when the user scrolls
/// to the end of the list. It uses a [ScrollController] to detect when the user has scrolled
/// to the end and triggers the [addEvent] callback to load more items.
///
/// Requires the [itemCount], [itemBuilder], and [addEvent] parameters.
///
/// Example usage:
/// ```dart
/// VerticalListView(
///   itemCount: 20,
///   itemBuilder: (context, index) {
///     return ListTile(
///       title: Text('Item $index'),
///     );
///   },
///   addEvent: () {
///     // Code to load more items
///   },
/// )
/// ```
class VerticalListView extends StatefulWidget {
  /// The number of items in the list.
  ///
  /// Determines how many items the list view will contain.
  final int itemCount;

  /// A function that creates a widget for each item in the list.
  ///
  /// The [itemBuilder] function takes the [BuildContext] and the item's index
  /// as parameters and returns a widget to be displayed at that index.
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// A callback function to trigger when the user scrolls to the end of the list.
  ///
  /// This function is called when the user reaches the end of the list,
  /// allowing for additional items to be loaded.
  final Function addEvent;

  /// Creates an instance of [VerticalListView].
  ///
  /// Requires [itemCount], [itemBuilder], and [addEvent] parameters.
  /// Optionally accepts a [key] for identifying the widget.
  const VerticalListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.addEvent,
  });

  @override
  State<VerticalListView> createState() => _VerticalListViewState();
}

class _VerticalListViewState extends State<VerticalListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppPadding.p8),
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppSize.s10);
      },
    );
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        widget.addEvent();
      }
    }
  }
}
