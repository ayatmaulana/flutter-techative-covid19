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
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/menu.svg",
                            height: 25,
                          ),
                          SvgPicture.asset(
                            "assets/svg/notification.svg",
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
