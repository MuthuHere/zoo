import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'entry_success_page.dart';

class GateEntryMainPage extends StatefulWidget {
  static const route = 'GateEntryMainPage';

  @override
  State<GateEntryMainPage> createState() => _GateEntryMainPageState();
}

class _GateEntryMainPageState extends State<GateEntryMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gate Entry'),
        ),
        body: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(EntrySuccessPage.route, arguments: true);
                  },
                  child: const Text('Success')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(EntrySuccessPage.route, arguments: false);
                  },
                  child: const Text('Failure')),
            ],
          ),
        ));
  }
}
