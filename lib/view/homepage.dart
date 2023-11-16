import 'package:e_wallet/controller/homepage_controller.dart';
import 'package:e_wallet/extensions/date_time_extension.dart';
import 'package:e_wallet/view/insight.dart';
import 'package:e_wallet/widgets/transfer_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(builder: (context, controller, child) {
      return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Current balance', style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('\$${controller.currentBalance.toString()}', style: const TextStyle(fontSize: 30, color: Colors.black)),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                        child: const Row(
                          children: [Icon(Icons.show_chart_outlined, color: Colors.green, size: 15), Text('+3.02%', style: TextStyle(color: Colors.green, fontSize: 10))],
                        ))
                  ]),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    customIcon(icon: Icons.add, color: Colors.yellow, borderColor: Colors.black, text: 'Add Money'),
                    GestureDetector(
                        onTap: () {
                          transferBottomSheet(context);
                        },
                        child: customIcon(icon: Icons.send, color: Colors.yellow, borderColor: Colors.black, text: 'Send Money')),
                    customIcon(icon: Icons.calendar_month_outlined, text: 'Scheduled'),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const InsightScreen(isClose: true)));
                        },
                        child: customIcon(icon: Icons.pie_chart, text: 'Insight'))
                  ]),
                  const SizedBox(height: 20),
                  Image.asset('assets/images/banner.jpg'),
                  const SizedBox(height: 20),
                  const Text('Transactions', style: TextStyle(fontSize: 20, color: Colors.black)),
                  const SizedBox(height: 20),
                  ListView.builder(
                      controller: ScrollController(),
                      shrinkWrap: true,
                      itemCount: controller.transactionItems.length,
                      itemBuilder: (context, index) {
                        final item = controller.transactionItems[index];
                        return Column(children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
                                    padding: const EdgeInsets.all(13),
                                    child: const Icon(Icons.paypal_outlined, color: Colors.black)),
                                const SizedBox(width: 10),
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(item.name, style: const TextStyle(fontSize: 18, color: Colors.black)),
                                  Text(item.paymentDate.format(), style: const TextStyle(fontSize: 15, color: Colors.grey)),
                                ]),
                                const Spacer(),
                                Text(item.amount, style: TextStyle(fontSize: 18, color: item.amount.contains('-') ? Colors.red : Colors.green))
                              ])),
                          const Divider()
                        ]);
                      })
                ])),
          ));
    });
  }
}
