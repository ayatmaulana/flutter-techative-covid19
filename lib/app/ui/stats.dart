import 'package:CovidApp/api/covid_api.dart';
import 'package:CovidApp/shared/base_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:CovidApp/model/stats.dart';
import 'package:CovidApp/model/chart_sample.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Statistic extends StatefulWidget {
  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  bool showLoading = true;
  Stats covidStats;

  @override
  // ignore: must_call_super
  initState() {
    setState(() {
      showLoading = true;
    });
    final apiInstance = CovidAPI();
    apiInstance.getStats().then((Stats response) {
      covidStats = response;
      setState(() {
        showLoading = false;
      });
    }).catchError((error) {
      setState(() {
        showLoading = false;
      });
    });
  }

  SfCartesianChart _getDefaultCategoryAxisChart() {
    return SfCartesianChart(
      title: ChartTitle(text: 'Covid Indonesia Stats'),
      plotAreaBorderWidth: 0,

      /// X axis as category axis placed here.
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          minimum: 0, maximum: 100, isVisible: false, labelFormat: '{value} %'),
      series: _getDefaultCategory(),
      tooltipBehavior:
          TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }

  /// Returns the list of chart series which need to render on the column chart.
  List<ColumnSeries<ChartSampleData, String>> _getDefaultCategory() {
    List<ChartSampleData> chartData = [];
    final regions = covidStats.regions;
    final total = covidStats.numbers.infected;
    final colors = [
      Colors.teal[300],
      Color.fromRGBO(53, 124, 210, 1),
      Colors.pink,
      Colors.orange,
      Colors.green,
      Colors.pink[300],
      Colors.purple[300],
      Color.fromRGBO(127, 132, 232, 1)
    ];

    for (var i = 0; i < 7; i++) {
      chartData.add(ChartSampleData(
          x: regions[i].name,
          yValue: (regions[i].numbers.infected * (100) / total),
          pointColor: colors[i]));
    }

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
    return showLoading
        ? SpinKitRotatingCircle(
            color: Colors.blue,
            size: 50.0,
          )
        : BasePage(
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
                  buildStats(
                      name: 'Affected',
                      value: covidStats?.numbers?.infected,
                      color: Color(0xFFFFBD4C)),
                  SizedBox(width: 15),
                  buildStats(
                      name: 'Death',
                      value: covidStats?.numbers?.fatal,
                      color: Color(0xFFFF5959)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  buildStats(
                      name: 'Recovered',
                      value: covidStats?.numbers?.recovered,
                      color: Color(0xFF4CD97B)),
                  SizedBox(width: 15),
                  buildStats(
                      name: 'Active',
                      // ignore: null_aware_before_operator
                      value: covidStats?.numbers != null
                          // ignore: null_aware_before_operator
                          ? (covidStats?.numbers?.infected -
                              covidStats?.numbers?.recovered -
                              covidStats?.numbers?.fatal)
                          : 0,
                      color: Color(0xFF4DB5FF)),
                  SizedBox(width: 15),
                  buildStats(
                      name: 'Serious', value: 0, color: Color(0xFF8359FF)),
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
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF27357D).withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 40,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: covidStats != null
                      ? _getDefaultCategoryAxisChart()
                      : Center())
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
