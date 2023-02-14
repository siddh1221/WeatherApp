import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/bloc/weather_cubit.dart';
import 'package:weatherapp/repo/weather_repo.dart';
import 'package:weatherapp/screen/splash_scree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(WeatherRespository()),
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(useMaterial3: true),
          home: const SplashScreen(),
        ),
         designSize: const Size(390, 844),
      ),
    );
  }
}
