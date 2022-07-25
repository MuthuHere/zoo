import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EntrySuccessPage extends StatefulWidget {
  static const route = 'EntrySuccessPage';

  @override
  State<EntrySuccessPage> createState() => _EntrySuccessPageState();
}

class _EntrySuccessPageState extends State<EntrySuccessPage> {
  bool isSuccess = true;
  String? loadingPath = 'assets/loading.json';
  bool isLoading = true;

  @override
  void initState() {
    isSuccess = Get.arguments;

    Future.delayed(const Duration(seconds: 6), () {
      loadingPath =
          isSuccess ? 'assets/nfc_success.json' : 'assets/failed_con.json';
      isLoading = false;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              loadingPath!,
            ),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? const SizedBox()
                : Text(
                    isSuccess ? 'ENTRY ACCESS SUCCESS!' : 'ENTRY ACCESS DENIED',
                    style: Get.textTheme.titleLarge!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: isSuccess ? Colors.greenAccent : Colors.redAccent,
                    ),
                  ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
