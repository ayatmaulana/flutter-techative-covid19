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

class Statistic extends StatefulWidget {
  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  Widget _buildItemForColor(Color c) => SizedBox.expand(
        child: DecoratedBox(decoration: BoxDecoration(color: c)),
      );

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
            child: SfCartesianChart(
                // Initialize category axis
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      // Bind data source
                      dataSource: <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ]))
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
