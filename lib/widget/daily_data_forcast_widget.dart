import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weather_model.dart';

import '../utils/custom_color.dart';

class DailyDataForcastWedget extends StatelessWidget {
  final WeatherModel weatherModel;
  const DailyDataForcastWedget({super.key, required this.weatherModel});
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat("EEE").format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: CustomeColors.cardColor,
          borderRadius: BorderRadiusDirectional.circular(20.r)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            alignment: Alignment.topLeft,
            child: Text(
              "Next Days",
              style: TextStyle(
                  color: CustomeColors.textColorBlack, fontSize: 17.sp),
            ),
          ),
          dailyList()
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        itemCount:
            weatherModel.daily.length > 7 ? 7 : weatherModel.daily.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                  height: 60.h,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80.w,
                        child: Text(
                          getDay(weatherModel.daily[index].dt),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: CustomeColors.textColorBlack,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: Image.asset(
                            "asset/weather/${weatherModel.daily[index].weather[0].icon}.png"),
                      ),
                      Text(
                          "${weatherModel.daily[index].temp.max}°/${weatherModel.daily[index].temp.min}")
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
