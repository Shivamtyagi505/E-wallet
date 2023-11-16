import 'package:e_wallet/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget getBottomNavBar(DashboardController controller) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.selectIndex,
        backgroundColor: Colors.grey[100],
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.bodySmall,
        unselectedLabelStyle: textTheme.bodySmall,
        onTap: controller.onTapBottomNavBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Near me'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Insight'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Profile'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(builder: (context, controller, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: getBottomNavBar(controller),
        body: controller.pages.elementAt(controller.selectIndex),
      );
    });
  }
}
