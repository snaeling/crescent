import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension DateTimeExtension on DateTime {
  String timeAgo() {
    final difference = DateTime.now().difference(this);
    final container = ProviderContainer();
    final loc = container.read(appLocalizationsProvider);
    if ((difference.inDays / 365).floor() >= 1) {
      return loc.years_ago((difference.inDays / 365).floor());
    } else if ((difference.inDays / 30).floor() >= 1) {
      return loc.months_ago((difference.inDays / 30).floor());
    } else if ((difference.inDays / 7).floor() >= 1) {
      return loc.week_ago((difference.inDays / 7).floor());
    } else if (difference.inDays >= 1) {
      return loc.days_ago(difference.inDays);
    } else if (difference.inHours >= 1) {
      return loc.hours_ago(difference.inHours);
    } else if (difference.inMinutes >= 1) {
      return loc.minutes_ago(difference.inMinutes);
    } else {
      return loc.just_now;
    }
  }
}
