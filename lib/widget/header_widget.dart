import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key, required this.lat, required this.lon});
  final String lat;
  final String lon;
  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat('yMMMMd').format(DateTime.now());
  @override
  void initState() {
    getAddress(widget.lat, widget.lon);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(double.parse(lat), double.parse(lon));
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.h, right: 20.w),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: TextStyle(
                fontSize: 35.sp, fontWeight: FontWeight.bold, height: 2.h),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.h, right: 20.w, bottom: 20.h),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
              height: 1.5.h,
            ),
          ),
        )
      ],
    );
  }
}
