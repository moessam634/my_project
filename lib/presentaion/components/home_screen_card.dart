import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/app_colors.dart';


// ignore: must_be_immutable
class HomeScreenCard extends StatelessWidget {
   HomeScreenCard({Key? key,required this.name}) : super(key: key);
String name;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: AppColors.kBackGroundColor,
            fontSize: 16.w,
          ),
        ),
      ),
    ),);
  }
}
