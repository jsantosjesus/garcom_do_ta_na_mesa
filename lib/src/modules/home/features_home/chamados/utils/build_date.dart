import 'dart:async';

import 'package:flutter/foundation.dart';

class BuildDate {
  final ValueNotifier<DateTime> now = ValueNotifier<DateTime>(DateTime.now());

  void startTimer() {
    Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      now.value = DateTime.now();
    });
  }

  String buildDate({required DateTime date}) {
    final bool wastoDay = date.day == now.value.day &&
        date.month == now.value.month &&
        date.year == now.value.year;

    final int differenceInHours = now.value.hour - date.hour;

    final bool wasNow =
        date.hour == now.value.hour && date.minute == now.value.minute;

    if (!wastoDay) {
      return '${date.day}/${date.month}/${date.year} às ${date.hour}:${date.minute}';
    } else if (!wasNow) {
      // print('hora date: ${date.hour}');
      final int time =
          ((differenceInHours * 60) - date.minute) + now.value.minute;
      final String plural = time > 1 ? 'minutos' : 'minuto';
      return 'à $time $plural';
    } else {
      return 'Agora';
    }
  }
}
