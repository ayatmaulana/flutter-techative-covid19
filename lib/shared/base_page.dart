import 'package:CovidApp/shared/load_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class BasePage extends StatefulWidget {
  List<Widget> children;

  BasePage({@required this.children});

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LoadSvg(
                            assetName: "assets/svg/menu.svg",
                            height: 25,
                          ),
                          LoadSvg(
                            assetName: "assets/svg/notification.svg",
                            height: 35,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ...widget.children
                    ]))));
  }
}
