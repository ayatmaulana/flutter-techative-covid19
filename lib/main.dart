import 'package:CovidApp/app/home/ui/Home.dart';
import 'package:CovidApp/app/stats/ui/stats.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tech A Tive Covid Demo",
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.comfortable,
        ),
        initialRoute: "/",
        builder: (context, widget) {
          ScreenUtil.init(context,
              width: 750, height: 1334, allowFontScaling: false);

          ResponsiveWidgets.init(
            context,
            height: 1920, // Optional
            width: 1080, // Optional
            allowFontScaling: true, // Optional
          );

          final responsiveWidgetBuilder = ResponsiveWidgets.builder(
            child: widget,
            height: 1920, // Optional
            width: 1080, // Optional
            allowFontScaling: true, // Optional
          );

          return ResponsiveWrapper.builder(responsiveWidgetBuilder,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ],
              background: Container(color: Color(0xFFF5F5F5)));
        },
        home: Navigation());
  }
}

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;

  Widget buildPage() {
    if (_page == 0) {
      return Home();
    } else if (_page == 1) {
      return Statistic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          backgroundColor: Colors.white,
          color: Color(0xFF56549E),
          buttonBackgroundColor: Color(0xFF56549E),
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.account_box,
              size: 30,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: SafeArea(child: buildPage()));
  }
}
