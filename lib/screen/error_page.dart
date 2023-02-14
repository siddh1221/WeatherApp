import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/screen/splash_scree.dart';

import '../utils/custom_color.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Check error and do refresh"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: CustomeColors.cardColor,
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.errorMessage,
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen(),
                        ),
                        (route) => false);
                  },
                  child: const Text("Refresh"),
                )
              ],
            ),
          ),
        ));
  }
}
