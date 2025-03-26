import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:school_helper/functions/functions.dart';
import 'package:school_helper/themes/light_theme.dart';

class PieChartAll extends StatefulWidget {
  const PieChartAll({super.key});

  @override
  State<PieChartAll> createState() => _PieChartAllState();
}

class _PieChartAllState extends State<PieChartAll> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Column(
        children: [
          Text(
            'Среднее\nза всё время:\n${getNormAllTheTiem(context)}%',
            style: theme.textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          SizedBox(
            height: (MediaQuery.of(context).size.width - 16) / 2,
            width: (MediaQuery.of(context).size.width - 16) / 2,
            child: PieChart(
              curve: Curves.decelerate,
              duration: Duration(milliseconds: 1000),
              PieChartData(
                startDegreeOffset: 270,
                sections: <PieChartSectionData>[
                  PieChartSectionData(
                    radius: 30,
                    value: getNormAllTheTiem(context),
                    color: theme.secondaryColor,
                    showTitle: false,
                  ),
                  PieChartSectionData(
                    radius: 20,
                    value: 100 - getNormAllTheTiem(context),
                    color: theme.averageBaseChartColor,
                    showTitle: false,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
