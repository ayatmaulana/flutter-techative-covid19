import 'package:CovidApp/shared/base_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const cellRed = Color(0xffc73232);
const cellMustard = Color(0xffd7aa22);
const cellGrey = Color(0xffcfd4e0);
const cellBlue = Color(0xff1553be);
const background = Color(0xff242830);

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
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
  final num y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color pointColor;

  /// Holds size of the datapoint
  final num size;

  /// Holds datalabel/text value mapper of the datapoint
  final String text;

  /// Holds open value of the datapoint
  final num open;

  /// Holds close value of the datapoint
  final num close;

  /// Holds low value of the datapoint
  final num low;

  /// Holds high value of the datapoint
  final num high;

  /// Holds open value of the datapoint
  final num volume;
}

class Statistic extends StatefulWidget {
  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  SfCartesianChart _getDefaultCategoryAxisChart() {
    return SfCartesianChart(
      title: ChartTitle(text: 'Test'),
      plotAreaBorderWidth: 0,

      /// X axis as category axis placed here.
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          minimum: 0, maximum: 80, isVisible: false, labelFormat: '{value}M'),
      series: _getDefaultCategory(),
      tooltipBehavior:
          TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }

  /// Returns the list of chart series which need to render on the column chart.
  List<ColumnSeries<ChartSampleData, String>> _getDefaultCategory() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'South\nKorea', yValue: 39, pointColor: Colors.teal[300]),
      ChartSampleData(
          x: 'India',
          yValue: 20,
          pointColor: const Color.fromRGBO(53, 124, 210, 1)),
      ChartSampleData(x: 'South\nAfrica', yValue: 61, pointColor: Colors.pink),
      ChartSampleData(x: 'China', yValue: 65, pointColor: Colors.orange),
      ChartSampleData(x: 'France', yValue: 45, pointColor: Colors.green),
      ChartSampleData(
          x: 'Saudi\nArabia', yValue: 10, pointColor: Colors.pink[300]),
      ChartSampleData(x: 'Japan', yValue: 16, pointColor: Colors.purple[300]),
      ChartSampleData(
          x: 'Mexico',
          yValue: 31,
          pointColor: const Color.fromRGBO(127, 132, 232, 1))
    ];
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.yValue,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      children: [
        Row(
          children: [
            Text(
              "Statistics",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            buildStats(name: 'Affected', value: 2000, color: Color(0xFFFFBD4C)),
            SizedBox(width: 15),
            buildStats(name: 'Death', value: 223423, color: Color(0xFFFF5959)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            buildStats(
                name: 'Recovered', value: 244324, color: Color(0xFF4CD97B)),
            SizedBox(width: 15),
            buildStats(name: 'Active', value: 223432, color: Color(0xFF4DB5FF)),
            SizedBox(width: 15),
            buildStats(
                name: 'Serious', value: 223432, color: Color(0xFF8359FF)),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Text(
              "Statistics",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF27357D).withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 40,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: _getDefaultCategoryAxisChart())
      ],
    );
  }

  Widget buildStats({
    String name,
    int value,
    Color color,
  }) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500,
        ),
        // width: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(10)),
        ),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Colors.white),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
