import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../network/api_constants.dart';
import '../local_models/media.dart';
import '../shared/overview_section.dart';
import '../shared/section_listview.dart';
import '../shared/section_listview_card.dart';
import '../shared/section_title.dart';
import '../resources/app_colors.dart';
import '../router/app_routes.dart';
import '../resources/app_strings.dart';
import '../resources/app_values.dart';

/// Formats a date string from the format "YYYY-MM-DD" to "MMM DD, YYYY".
///
/// Returns an empty string if the input date is null or empty.
///
/// [date] - The date string in "YYYY-MM-DD" format.
String getDate(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }

  final vals = date.split('-');
  String year = vals[0];
  int monthNb = int.parse(vals[1]);
  String day = vals[2];

  String month = '';

  switch (monthNb) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'Mar';
      break;
    case 4:
      month = 'Apr';
      break;
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'Jun';
      break;
    case 7:
      month = 'Jul';
      break;
    case 8:
      month = 'Aug';
      break;
    case 9:
      month = 'Sep';
      break;
    case 10:
      month = 'Oct';
      break;
    case 11:
      month = 'Nov';
      break;
    case 12:
      month = 'Dec';
      break;
    default:
      break;
  }

  return '$month $day, $year';
}

/// Constructs a poster URL from a path.
///
/// Returns a placeholder URL if the path is null.
///
/// [path] - The path to append to the base poster URL.
String getPosterUrl(String? path) {
  if (path != null) {
    return ApiConstants.basePosterUrl + path;
  } else {
    return ApiConstants.noImagePlaceholder;
  }
}

/// Constructs a backdrop URL from a path.
///
/// Returns a placeholder URL if the path is null.
///
/// [path] - The path to append to the base backdrop URL.
String getBackdropUrl(String? path) {
  if (path != null) {
    return ApiConstants.baseBackdropUrl + path;
  } else {
    return ApiConstants.noImagePlaceholder;
  }
}

/// Constructs a still image URL from a path.
///
/// Returns a placeholder URL if the path is null.
///
/// [path] - The path to append to the base still image URL.
String getStillUrl(String? path) {
  if (path != null) {
    return ApiConstants.baseStillUrl + path;
  } else {
    return ApiConstants.noImagePlaceholder;
  }
}

/// Formats a runtime integer to a human-readable string.
///
/// Returns an empty string if the runtime is null or zero.
/// Formats runtime in hours and minutes.
///
/// [runtime] - The runtime in minutes.
String getLength(int? runtime) {
  if (runtime == null || runtime == 0) {
    return '';
  }
  if (runtime < 60) {
    return '${runtime}m';
  }
  if (runtime % 60 == 0) {
    return '${runtime ~/ 60}h';
  }
  return '${runtime ~/ 60}h ${runtime % 60}m';
}

/// Formats a vote count to a human-readable string.
///
/// Converts vote count to "k" for thousands.
///
/// [voteCount] - The total number of votes.
String getVotesCount(int voteCount) {
  if (voteCount < 1000) {
    return '($voteCount)';
  }
  return '(${voteCount ~/ 1000}k)';
}

/// Constructs a profile image URL from a JSON map.
///
/// Returns a placeholder URL if the profile path is not present.
///
/// [json] - A map containing the profile image path.
String getProfileImageUrl(Map<String, dynamic> json) {
  if (json['profile_path'] != null) {
    return ApiConstants.baseProfileUrl + json['profile_path'];
  } else {
    return ApiConstants.noImagePlaceholder;
  }
}

/// Calculates the elapsed time since a given date.
///
/// Formats the elapsed time in years, months, weeks, days, hours, or minutes.
///
/// [date] - The date string in ISO 8601 format.
String getElapsedTime(String date) {
  DateTime reviewDate = DateTime.parse(date);
  DateTime today = DateTime.now();

  Duration diff = today.difference(reviewDate);
  if (diff.inDays >= 365) {
    int years = diff.inDays ~/ 365;
    return '${years}y';
  } else if (diff.inDays >= 30) {
    int months = diff.inDays ~/ 30;
    return '${months}mo';
  } else if (diff.inDays >= 7) {
    int weeks = diff.inDays ~/ 7;
    return '${weeks}w';
  } else if (diff.inDays >= 1) {
    return '${diff.inDays}d';
  } else if (diff.inHours >= 1) {
    int hours = diff.inHours ~/ 24;
    return '${hours}h';
  } else if (diff.inMinutes >= 1) {
    int minutes = diff.inDays ~/ 60;
    return '${minutes}min';
  } else {
    return 'Now';
  }
}

/// Gets the first genre name from a list.
///
/// Returns an empty string if the list is empty.
///
/// [genres] - A list of genre maps.
String getGenres(List<dynamic> genres) {
  if (genres.isNotEmpty) {
    return genres.first['name'];
  } else {
    return '';
  }
}

/// Constructs an avatar URL from a path.
///
/// Handles paths from Gravatar by removing leading slashes.
///
/// Returns a placeholder URL if the path is null.
///
/// [path] - The path to append to the base avatar URL.

String getAvatarUrl(String? path) {
  if (path != null) {
    if (path.startsWith('/https://www.gravatar.com/avatar')) {
      return path.substring(1);
    } else {
      return ApiConstants.baseAvatarUrl + path;
    }
  } else {
    return ApiConstants.noImagePlaceholder;
  }
}

/// Constructs a trailer URL from a JSON map.
///
/// Returns an empty string if no trailer is found.
///
/// [json] - A map containing video information.
String getTrailerUrl(Map<String, dynamic> json) {
  List videos = json['videos']['results'];
  if (videos.isNotEmpty) {
    List trailers = videos.where((e) => e['type'] == 'Trailer').toList();
    if (trailers.isNotEmpty) {
      return ApiConstants.baseVideoUrl + trailers.last['key'];
    } else {
      return '';
    }
  } else {
    return '';
  }
}

/// Launches a URL in the default browser.
///
/// Throws an exception if the URL cannot be launched.
///
/// [url] - The URL to launch.
Future<void> launchAnUrl(String url) async {
  Uri? url0 = Uri.tryParse(url);
  if (url0 != null) {
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url');
    }
  }
}

/// Navigates to the details view of a media item.
///
/// [context] - The build context to use for navigation.
/// [media] - The media item to navigate to.
void navigateToDetailsView(BuildContext context, Media media) {
  context.pushNamed(
    AppRoutes.movieDetailsRoute,
    params: {'movieId': media.tmdbID.toString()},
  );
}

/// Creates a widget for displaying a list of similar media items.
///
/// Returns an empty `SizedBox` if the list is null or empty.
///
/// [similar] - A list of similar media items.
Widget getSimilarSection(List<Media>? similar) {
  if (similar != null && similar.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.similar),
        SectionListView(
          height: AppSize.s240,
          itemCount: similar.length,
          itemBuilder: (context, index) => SectionListViewCard(
            media: similar[index],
          ),
        ),
      ],
    );
  } else {
    return const SizedBox();
  }
}

/// Creates a widget for displaying an overview section.
///
/// Returns an empty `SizedBox` if the overview is empty.
///
/// [overview] - The overview text to display.
Widget getOverviewSection(String overview) {
  if (overview.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.story),
        OverviewSection(overview: overview),
      ],
    );
  } else {
    return const SizedBox();
  }
}

/// Shows a custom bottom sheet with a given child widget.
///
/// [context] - The build context to use for showing the bottom sheet.
/// [child] - The widget to display in the bottom sheet.
void showCustomBottomSheet(BuildContext context, Widget child) {
  final size = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.secondaryBackground,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppSize.s20),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: size * 0.5,
        child: child,
      );
    },
  );
}

/// Displays a snack bar with the given content.
///
/// [context] - The build context to use for showing the snack bar.
/// [content] - The text content of the snack bar.
void showSnackBar(BuildContext context, String content) {
  final snackBar = SnackBar(content: Text(content));
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
