import 'package:explore/view/colors.dart';
import 'package:explore/view/pages/home.dart';
import 'package:explore/view/pages/register.dart';
import 'package:flutter/material.dart';

class ViewHome extends StatelessWidget {
  ViewHome({super.key});

  final List<Widget> listTabs = [
    const Tab(
      icon: Icon(Icons.home),
      text: 'Home',
    ),
    const Tab(
      icon: Icon(Icons.pin_drop),
      text: 'Register',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: listTabs.length,
      child: Scaffold(
        backgroundColor: gray,
        body: Stack(
          children: [
            TabBarView(
              children: [Home(), Register()],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                color: gray,
                child: TabBar(
                  tabs: listTabs,
                  indicatorColor: Colors.grey,
                  indicatorWeight: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
