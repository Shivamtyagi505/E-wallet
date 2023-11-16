import 'package:e_wallet/controller/homepage_controller.dart';
import 'package:e_wallet/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> transferBottomSheet(BuildContext context) async {
  final textController = TextEditingController();
  showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      builder: (_) {
        return Consumer<HomePageController>(builder: (context, controller, child) {
          return Wrap(
            children: [
              Row(children: [
                Align(alignment: Alignment.topLeft, child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))),
                const SizedBox(width: 120),
                const Center(child: Text('Transfer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
              ]),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey)), padding: const EdgeInsets.all(15), child: const Icon(Icons.send)),
                  const SizedBox(height: 10),
                  const Text('Send To', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey)),
                  const SizedBox(height: 10),
                  const Text('Ruben Vaccaro', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 30),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: TextField(keyboardType: TextInputType.number, controller: textController)),
                  const SizedBox(height: 10),
                  const Text('Available in balance: \$1200.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom != 0 ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height - 600),
                  GestureDetector(
                    onTap: () {
                      controller
                          .addItem(Transaction(name: 'Demo payment', paymentDate: DateTime.now(), amount: '\$${textController.text}', price: double.parse(textController.text)));
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue[900]),
                        child: const Text('Continue', style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          );
        });
      });
}
