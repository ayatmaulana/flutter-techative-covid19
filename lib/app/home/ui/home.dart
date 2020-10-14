import 'package:CovidApp/shared/base_page.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BasePage(children: [
      Row(
        children: [
          Text(
            "Covid 19",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          )
        ],
      ),
      SizedBox(
        height: 30,
      ),
      SvgPicture.asset(
        "assets/svg/home_1.svg",
        width: double.infinity,
        height: 135,
      ),
      SizedBox(
        height: 30,
      ),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Are you feeling Sick?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "If you feeling sick with any of covid19 symptomps please call or SMS us immediately for help",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(0xFF61688B)),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/svg/callnow.svg",
            height: 51,
          ),
          SvgPicture.asset(
            "assets/svg/smsnow.svg",
            height: 51,
          )
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        "Prevention",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svg/avoid_close_contact.svg",
                  height: 110,
                ),
                Center(
                  child: Text(
                    "Avoid close contact",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 90,
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svg/clean_your_hand.svg",
                  height: 110,
                ),
                Center(
                  child: Text(
                    "clean your hands often",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 90,
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svg/wear_face_mask.svg",
                  height: 110,
                ),
                Center(
                  child: Text(
                    "Wear a facemask",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
