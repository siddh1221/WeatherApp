import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/utils/custom_color.dart';

class HourlyDataWidget extends StatefulWidget {
  const HourlyDataWidget({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  State<HourlyDataWidget> createState() => _HourlyDataWidgetState();
}

class _HourlyDataWidgetState extends State<HourlyDataWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
          alignment: Alignment.topCenter,
          child: Text(
            "Today",
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
        houarlyList()
      ],
    );
  }

  Widget houarlyList() {
    return Container(
      height: 160.h,
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.weatherModel.hourly.length > 12
            ? 12
            : widget.weatherModel.hourly.length,
        itemBuilder: (BuildContext context, int index) {
          print(widget.weatherModel.hourly[index].weather[0].icon.toString());
          return GestureDetector(
            onTap: () {
              setIndex(index);
            },
            child: Container(
              width: 90.w,
              margin: EdgeInsets.only(left: 20.w, right: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: currentIndex != index ? CustomeColors.cardColor : null,
                  gradient: currentIndex == index
                      ? const LinearGradient(colors: [
                          CustomeColors.firstGradientColor,
                          CustomeColors.secondGradientColor
                        ])
                      : null),
              child: HourlyDetail(
                isenabel: currentIndex == index ? true : false,
                temp: widget.weatherModel.hourly[index].temp,
                timeStemp: widget.weatherModel.hourly[index].dt,
                weatherIcon: widget.weatherModel.hourly[index].weather[0].icon
                    .toString(),
              ),
            ),
          );
        },
      ),
    );
  }

  setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

class HourlyDetail extends StatelessWidget {
  const HourlyDetail(
      {super.key,
      required this.temp,
      required this.timeStemp,
      required this.weatherIcon,
      required this.isenabel});
  final int temp;
  final int timeStemp;
  final String weatherIcon;
  final bool isenabel;
  String gtTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStemp * 1000);
    String x = DateFormat("jm").format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Text(
            gtTime(timeStemp.toString()),
            style: TextStyle(
              color: isenabel ? Colors.white : Colors.black,
            ),
          ),
        ),
        Container(
          child: Image.asset("asset/weather/$weatherIcon.png"),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10.h),
          child: Text(
            "$temp°",
            style: TextStyle(
              color: isenabel ? Colors.white : Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
