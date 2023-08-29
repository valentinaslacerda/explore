import 'package:explore/view/colors.dart';
import 'package:explore/view/pages/home.dart';
import 'package:explore/view/pages/register.dart';
import 'package:flutter/material.dart';

class ViewHome extends StatelessWidget {
  ViewHome({super.key});

  List<Widget> listTabs = [
    Tab(
      icon: Icon(Icons.home),
      text: 'Home',
    ),
    Tab(
      icon: Icon(Icons.pin_drop),
      text: 'Register',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: listTabs.length,
        child: Scaffold(
          appBar: AppBar(
            leading: SizedBox(),
            backgroundColor: gray,
            elevation: 5,
            bottom: TabBar(
              tabs: listTabs,
              indicatorColor: Colors.grey,
              indicatorWeight: 3,
            ),
          ),
          body: TabBarView(children: [Home(), Register()]),
        ));
  }
}
