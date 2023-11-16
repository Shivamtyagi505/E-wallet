import 'package:e_wallet/view/insight.dart';
import 'package:flutter/material.dart';

import '../view/homepage.dart';

class DashboardController extends ChangeNotifier {
  int selectIndex = 0;

  void onTapBottomNavBar(int index) {
    selectIndex = index;
    notifyListeners();
  }

  List<Widget> pages = [
    const HomePage(),
    const Center(child: Text('Near Me')),
    const InsightScreen(isClose: false),
    const Center(child: Text('My Profile')),
  ];
}
