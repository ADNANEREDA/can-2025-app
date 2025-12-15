// lib/core/utils/time_helper.dart

class TimeHelper {
  static Map<String, String> getTimeLeft(DateTime targetDate) {
    final now = DateTime.now();
    final difference = targetDate.difference(now);

    if (difference.isNegative) {
      return {"unit1": "00", "label1": "DAYS", "unit2": "00", "label2": "HOURS", "unit3": "00", "label3": "MINS"};
    }

    if (difference.inHours > 24) {
      final days = difference.inDays.toString().padLeft(2, '0');
      final hours = (difference.inHours % 24).toString().padLeft(2, '0');
      final minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
      return {
        "unit1": days, "label1": "DAYS",
        "unit2": hours, "label2": "HOURS",
        "unit3": minutes, "label3": "MINS"
      };
    } else {
      final hours = difference.inHours.toString().padLeft(2, '0');
      final minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
      final seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');
      return {
        "unit1": hours, "label1": "HOURS",
        "unit2": minutes, "label2": "MINS",
        "unit3": seconds, "label3": "SECS"
      };
    }
  }
}
