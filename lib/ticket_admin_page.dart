import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TicketAdminPage extends StatefulWidget {
  static const route = 'TicketAdminPage';

  @override
  State<TicketAdminPage> createState() => _TicketAdminPageState();
}

class _TicketAdminPageState extends State<TicketAdminPage> {
  int _clickedItem = -1;

  List<String> packageItems = [
    'Mandai Wildlife Reserves: 2-in-1 Singapore Zoo & River Wonders',
    'Singapore Zoo Tickets',
    'Night Safari Singapore Ticket With Tram Ride',
    'River Wonders Singapore Ticket',
    'Jurong Bird Park Admission Ticket',
  ];

  bool isShowTransferAnim = false;

  @override
  initState() {
    _clickedItem = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Admin System'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: packageItems.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (index == _clickedItem) {
                      _clickedItem = -1;
                      return;
                    }
                    _clickedItem = index;
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _clickedItem == index
                            ? Colors.blueAccent
                            : Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        packageItems[index],
                        style: Get.textTheme.titleSmall?.copyWith(
                          color: _clickedItem == index
                              ? Colors.blueAccent
                              : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
            onPressed: _clickedItem == -1
                ? null
                : () {
                    Get.dialog(AlertDialog(
                      title: const Text('Scanning...'),
                      content: SizedBox(
                        height: 100,
                        width: 100,
                        child: Lottie.asset(
                          'assets/transfer.json',
                        ),
                      ),
                    ));

                    Future.delayed(const Duration(seconds: 5), () {
                      Get.back();
                      Get.dialog(AlertDialog(
                        title: const Text('Wrist band tagged successfully!'),
                        content: SizedBox(
                          height: 200,
                          width: 200,
                          child: Lottie.asset(
                            'assets/success_con.json',
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('OK'))
                        ],
                      ));
                    });
                    //   Future.delayed(const Duration(seconds: 3), () {
                    //     Get.back();
                    //   });
                  },
            child: const Text('Tag wrist band')),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
