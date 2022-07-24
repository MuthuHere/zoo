import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class MerchantAdminPage extends StatefulWidget {
  static const route = 'MerchantAdminPage';

  @override
  State<MerchantAdminPage> createState() => _MerchantAdminPageState();
}

class _MerchantAdminPageState extends State<MerchantAdminPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.pink,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.pink,
                    ),
                  ),
                  Text(
                    'INUCA CAFE',
                    style: Get.textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        DateFormat('dd-MMM-yyyy').format(DateTime.now()),
                        style: Get.textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        DateFormat('hh:mm a').format(DateTime.now()),
                        style: Get.textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            rowItem('Total Transactions', '29'),
            const SizedBox(height: 5),
            rowItem('Total Amount', 'S\$1380.00'),
            const Spacer(),
            const Divider(),
            Container(
              width: Get.width,
              height: Get.height * .17,
              // color: Colors.pinkAccent[100],
              child: Center(
                child: Text(
                  'Welcome to INUCA CAFE',
                  style: Get.textTheme.headline6!.copyWith(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Divider(),
            const Spacer(),
            SizedBox(
              width: Get.width - 25,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Payment in progress..'),
                      content: SizedBox(
                        height: 100,
                        width: 100,
                        child: Lottie.asset(
                          'assets/transfer.json',
                        ),
                      ),
                    ),
                  );

                  Future.delayed(const Duration(seconds: 5),(){
                    Get.back();
                    Get.dialog(AlertDialog(
                      title: const Text('Payment success!'),
                      content: Lottie.asset(
                        'assets/success_con.json',
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
                },
                child: const Text('Tap to Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Get.textTheme.headline6,
          ),
          Text(
            value,
            style: Get.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
