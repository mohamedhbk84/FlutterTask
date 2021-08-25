import 'package:flutter/material.dart';
import 'package:fluttertest/Modules/BottomNavagation/HomeBottomNav.dart';
import 'package:fluttertest/Modules/TabScreen/Flights.dart';
import 'package:fluttertest/Modules/TabScreen/Hotels.dart';
import 'package:fluttertest/Modules/TabScreen/Other.dart';
import 'package:fluttertest/Modules/TabScreen/Places.dart';
import 'package:fluttertest/Shared/component/componentButton.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  List<Widget> tabs = [
    Text("Explore"),
    Text("Flights"),
    Text("Hotels"),
    Text("Places"),
    Text("Other"),
  ];
  List<Widget> screens;
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Egypt Airport",
        search: true,
      ),
      body: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
            controller: tabController,
            tabs: tabs,
            labelColor: Color(0xffFE647D),
            physics: BouncingScrollPhysics(),
            indicatorColor: Color(0xffFE647D),
            indicatorWeight: 5.0,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  width: 5.0,
                  color: Color(0xffFE647D),
                  style: BorderStyle.solid),
              insets: EdgeInsets.only(left: 20.0, bottom: 8, right: 29),
            ),
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.only(top: 15, right: 15, bottom: 15),
            unselectedLabelColor: Colors.black,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Divider(
          //     thickness: 1,
          //     color: Colors.grey[400],
          //   ),
          // ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: screens = [
              BottomNavagationBar(),
              FlightsScreen(),
              HotelsScreen(),
              PlacesScreen(),
              OtherScreen(),
            ],
          ))
        ],
      ),
    );
  }
}
