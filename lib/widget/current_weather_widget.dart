import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/model/weather_model.dart';

import '../utils/custom_color.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temprature area
        tempratureAreaWidget(),
        SizedBox(
          height: 20.h,
        ),
        currentWeatherMoreDetailWidget(),
      ],
    );
  }

  Widget tempratureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "asset/weather/${weatherModel.current.weather[0].icon}.png",
          height: 100.h,
          width: 100.w,
          fit: BoxFit.cover,
        ),
        Container(
          height: 50.h,
          width: 1.w,
          color: CustomeColors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${weatherModel.current.temp.toString()}°",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68.sp,
                  color: CustomeColors.textColorBlack)),
          TextSpan(
              text: weatherModel.current.weather[0].description
                  .toString()
                  .substring(12)
                  .toLowerCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.grey))
        ]))
      ],
    );
  }

  Widget currentWeatherMoreDetailWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomeColors.cardColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.asset('asset/wind_sped.png'),
            ),
            Container(
              height: 60.h,
              width: 60.w,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomeColors.cardColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.asset('asset/cloud.png'),
            ),
            Container(
              height: 60.h,
              width: 60.w,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomeColors.cardColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.asset('asset/humidity.png'),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20.h,
              width: 70.w,
              child: Text(
                "${weatherModel.current.windSpeed}Km/h",
                style: TextStyle(fontSize: 12.w),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.h,
              width: 70.w,
              child: Text(
                "${weatherModel.current.clouds}%",
                style: TextStyle(fontSize: 12.w),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.h,
              width: 70.w,
              child: Text(
                "${weatherModel.current.humidity}%",
                style: TextStyle(fontSize: 12.w),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    );
  }
}
