import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp/model/weather_model.dart';

import '../utils/custom_color.dart';

class ComfortLevelWedget extends StatelessWidget {
  const ComfortLevelWedget({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: 1.h, left: 20.w, right: 20.w, bottom: 20.h),
          child: Text(
            "Comfort Level",
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
        SizedBox(
          height: 180.h,
          child: Column(
            children: [
              Center(
                  child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: weatherModel.current.humidity.toDouble(),
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                    infoProperties: InfoProperties(
                        bottomLabelText: "Humidity",
                        bottomLabelStyle: TextStyle(
                            letterSpacing: 0.1,
                            height: 1.5.h,
                            fontSize: 14.sp,
                            color: CustomeColors.textColorBlack)),
                    animationEnabled: true,
                    size: 140.sp,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            CustomeColors.firstGradientColor.withAlpha(100),
                        progressBarColors: [
                          CustomeColors.firstGradientColor,
                          CustomeColors.secondGradientColor
                        ])),
              ))
            ],
          ),
        )
      ],
    );
  }
}
