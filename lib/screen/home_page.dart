import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/bloc/weather_cubit.dart';
import 'package:weatherapp/bloc/weather_state.dart';
import 'package:weatherapp/widget/hourly_data_wedget.dart';

import '../utils/custom_color.dart';
import '../widget/comfort_level.dart';
import '../widget/current_weather_widget.dart';
import '../widget/daily_data_forcast_widget.dart';
import '../widget/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.lat,
      required this.lon,
      required this.isLocationGrantd});
  final String lat;
  final String lon;
  final bool isLocationGrantd;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<WeatherCubit>(context).getWeather(widget.lat, widget.lon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is WeatherLoadedState) {
            return Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  HeaderWidget(
                    lat: widget.lat,
                    lon: widget.lon,
                  ),
                  //Current temperature
                  CurrentWeatherWidget(
                    weatherModel: state.weatherModel,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  HourlyDataWidget(
                    weatherModel: state.weatherModel,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DailyDataForcastWedget(
                    weatherModel: state.weatherModel,
                  ),
                  Container(
                    height: 1.h,
                    color: CustomeColors.dividerLine,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ComfortLevelWedget(
                    weatherModel: state.weatherModel,
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("some thing went wrong"),
            );
          }
        },
      ),
    );
  }
}
