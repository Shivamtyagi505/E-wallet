import 'package:e_wallet/controller/homepage_controller.dart';
import 'package:e_wallet/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InsightScreen extends StatefulWidget {
  final bool isClose;
  const InsightScreen({super.key, this.isClose = false});

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  final List<ChartData> chartData = [
    ChartData(2012, 32),
    ChartData(2013, 40),
    ChartData(2014, 34),
    ChartData(2015, 52),
    ChartData(2018, 42),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(builder: (context, controller, child) {
      return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            centerTitle: true,
            leading: widget.isClose ? GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.close, color: Colors.black)) : null,
            title: const Text('Insight', style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 10),
                  Container(
                      height: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
                            padding: const EdgeInsets.all(13),
                            child: const Icon(Icons.pie_chart, color: Colors.black)),
                        const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('43,21 left', style: TextStyle(color: Colors.black, fontSize: 20)),
                          Text('Monthly budget • 14 days to go', style: TextStyle(color: Colors.grey, fontSize: 15))
                        ]),
                        const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black)
                      ])),
                  const SizedBox(height: 20),
                  const Text('Balance Overview', style: TextStyle(color: Colors.black, fontSize: 20)),
                  const SizedBox(height: 10),
                  const Text('----- Current month    -- -- 4 month', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 20),
                  SizedBox(
                      height: 200,
                      child: SfCartesianChart(series: <ChartSeries>[
                        StepLineSeries<ChartData, num>(dataSource: chartData, xValueMapper: (ChartData data, _) => data.x, yValueMapper: (ChartData data, _) => data.y)
                      ])),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
                      child: const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Expenses', style: TextStyle(color: Colors.black, fontSize: 15)),
                        SizedBox(height: 10),
                        Text('-\$432.23', style: TextStyle(color: Colors.black, fontSize: 20))
                      ]),
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
                            child: const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('Money in', style: TextStyle(color: Colors.black, fontSize: 15)),
                              SizedBox(height: 10),
                              Text('\$1432.23', style: TextStyle(color: Colors.black, fontSize: 20))
                            ])))
                  ]),
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

class ChartData {
  int x;
  int y;
  ChartData(this.x, this.y);
}
