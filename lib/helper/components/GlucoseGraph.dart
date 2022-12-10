import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NumericAxisWithLableFormatGraph extends StatefulWidget {
  const NumericAxisWithLableFormatGraph({super.key});

  @override
  State<NumericAxisWithLableFormatGraph> createState() =>
      _NumericAxisWithLableFormatGraphState();
}

class _NumericAxisWithLableFormatGraphState
    extends State<NumericAxisWithLableFormatGraph> {
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        header: '',
        canShowMarker: true,
        color: HealthMateColors.hotPurple,
        format: 'point.x / point.y');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildChart();
  }

  Widget _buildChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      // palette: [
      //   HealthMateColors.hotPurple,
      //   HealthMateColors.hotPurple,
      //   HealthMateColors.hotPurple,
      //   HealthMateColors.hotPurple,
      //   HealthMateColors.hotPurple
      // ],
      title: ChartTitle(text: 'Glucose'),
      // plotAreaBackgroundColor: HealthMateColors.bgColor,
      primaryXAxis: NumericAxis(
          labelFormat: '{value}',
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}g/mol',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: getNumericLabelSeries(),

      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Return the line series with numeric axis label.
  List<LineSeries<ChartSampleData, num>> getNumericLabelSeries() {
    return <LineSeries<ChartSampleData, num>>[
      LineSeries<ChartSampleData, num>(
          dataSource: <ChartSampleData>[
            // ChartSampleData(xValue: 1, yValue: 32),
            // ChartSampleData(xValue: 2, yValue: 41),
            // ChartSampleData(xValue: 3, yValue: 50),
            // ChartSampleData(xValue: 4, yValue: 59),
            // ChartSampleData(xValue: 5, yValue: 68),
            // ChartSampleData(xValue: 6, yValue: 77),
            // ChartSampleData(xValue: 7, yValue: 86),
            // ChartSampleData(xValue: 8, yValue: 95),
            // ChartSampleData(xValue: 9, yValue: 104),

            for (int i = 1; i < 31; i++)
              ChartSampleData(xValue: i, yValue: Random().nextInt(100)),
          ],
          xValueMapper: (ChartSampleData sales, _) => sales.xValue as num,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          width: 2,
          markerSettings: MarkerSettings(
              isVisible: true,
              // Marker shape is set to diamond
              shape: DataMarkerType.pentagon)),
    ];
  }
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}

/// Chart Sales Data
class SalesData {
  /// Holds the datapoint values like x, y, etc.,
  SalesData(this.x, this.y, [this.date, this.color]);

  /// X value of the data point
  final dynamic x;

  /// y value of the data point
  final dynamic y;

  /// color value of the data point
  final Color? color;

  /// Date time value of the data point
  final DateTime? date;
}
