import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:workout_planner/datetime/date_time.dart';

class MyHeatmap extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDateYYYYMMDD;
  const MyHeatmap(
      {super.key, required this.datasets, required this.startDateYYYYMMDD});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: HeatMap(
        startDate: createDateTimeObject(startDateYYYYMMDD),
        endDate: DateTime.now().add(const Duration(days: 0)),
        datasets: datasets,
        defaultColor: Colors.white,
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        colorMode: ColorMode.color,
        colorsets: const {1: Colors.green},
      ),
    );
  }
}
