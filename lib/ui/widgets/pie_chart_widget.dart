import 'package:flutter/material.dart';



import 'package:fl_chart/fl_chart.dart';

import 'package:money_management/ui/Helper/colors.dart';
import 'package:money_management/utils/statistics.dart';

class PieWidget extends StatefulWidget {
  const PieWidget({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 55.0 : 45.0;
      switch (i) {

        case 0:
          return PieChartSectionData(
            color: Red,
            value: Statistics.Pmonth(),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          );

        case 1:
          return PieChartSectionData(
            color:  Oreng,
            value: Statistics.Pday(),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,

            ),
          );

        case 2:
          return PieChartSectionData(
            color:  Purple,
            value: Statistics.Dday(),
            radius: radius,
            title: '',
            titleStyle: TextStyle(
              fontSize: fontSize,
            ),
          );

        case 3:
          return PieChartSectionData(
            color:  Pink,
            value: Statistics.Dmonth(),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
            ),
          );






        default:
          throw Error();
      }
    });
  }
}