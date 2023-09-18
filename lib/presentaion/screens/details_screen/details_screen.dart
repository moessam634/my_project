import 'dart:developer';
import 'package:final_project/app/app_constants.dart';
import 'package:final_project/data/cubits/popular_details_cubit/popular_details_cubit.dart';
import 'package:final_project/presentaion/screens/image_preview/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/app_colors.dart';
import '../../../app/app_words.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.id, required this.name})
      : super(key: key);
  int id;
  String name;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    PopularDetailsCubit.get(context).getDetails(id: widget.id);
    PopularDetailsCubit.get(context).getImages(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularDetailsCubit, PopularDetailsState>(
      listener: (context, state) {
        state is PopularDetailsError ? log(AppWords.errorHappened) : null;
      },
      builder: (context, state) {
        return state is PopularDetailsLoading || state is PopularImageLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  backgroundColor: AppColors.kPrimaryColor,
                  title: Text("${AppWords.detailsAboutActor} ${widget.name}"),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2 - 50,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppWords.locationOfBirth +
                                  PopularDetailsCubit.get(context)
                                      .popularDetailsModel
                                      .placeOfBirth
                                      .toString(),
                              style: const TextStyle(
                                  color: AppColors.kBackGroundColor),
                            ),
                            Text(
                              AppWords.popularity +
                                  PopularDetailsCubit.get(context)
                                      .popularDetailsModel
                                      .popularity
                                      .toString(),
                              style: const TextStyle(
                                  color: AppColors.kBackGroundColor),
                            ),
                            Text(
                              AppWords.job +
                                  PopularDetailsCubit.get(context)
                                      .popularDetailsModel
                                      .knownForDepartment
                                      .toString(),
                              style: const TextStyle(
                                  color: AppColors.kBackGroundColor),
                            ),
                            Text(
                              AppWords.birthDay +
                                  PopularDetailsCubit.get(context)
                                      .popularDetailsModel
                                      .birthday
                                      .toString(),
                              style: const TextStyle(
                                  color: AppColors.kBackGroundColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2 - 48,
                          width: double.infinity,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (builder) => ImagePreview(
                                            height:
                                                PopularDetailsCubit.get(context)
                                                        .popularImagesModel
                                                        .profiles![index]
                                                        .height ??
                                                    200,
                                            width:
                                                PopularDetailsCubit.get(context)
                                                        .popularImagesModel
                                                        .profiles![index]
                                                        .width ??
                                                    200,
                                            path:
                                                PopularDetailsCubit.get(context)
                                                        .popularImagesModel
                                                        .profiles![index]
                                                        .filePath ??
                                                    '',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                        AppConstants.imageBaseUrl +
                                            PopularDetailsCubit.get(context)
                                                .popularImagesModel
                                                .profiles![index]
                                                .filePath!,
                                        width: 200,
                                        height: 200));
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 16.h,
                                );
                              },
                              itemCount: PopularDetailsCubit.get(context)
                                  .popularImagesModel
                                  .profiles!
                                  .length),
                        ),
                      )
                    ],
                  ),
                ));
      },
    );
  }
}
