import 'package:final_project/data/cubits/popular_details_cubit/popular_details_cubit.dart';
import 'package:final_project/presentaion/screens/details_screen/details_screen.dart';
import 'package:final_project/presentaion/screens/home_screen/home_screen.dart';
import 'package:final_project/presentaion/screens/image_preview/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/cubits/popular_cubit/popular_cubit.dart';

main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PopularCubit>(
          create: (BuildContext context) => PopularCubit(),
        ),
        BlocProvider<PopularDetailsCubit>(
          create: (BuildContext context) => PopularDetailsCubit(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(365, 812),
      splitScreenMode: true,
      builder: (_, child) {
        return  const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}
