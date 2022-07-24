import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_router.dart';
import 'gate_entry_main_page.dart';
import 'merchant_admin_page.dart';
import 'ticket_admin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mandai POC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mandai POC'),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(TicketAdminPage.route);
                  },
                  child: const Text('Ticket Admin')),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MerchantAdminPage.route);
                  },
                  child: const Text('Merchant Admin')),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(GateEntryMainPage.route);
                  },
                  child: const Text('Gate Entry')),
            ],
          ),
        ));
  }
}
