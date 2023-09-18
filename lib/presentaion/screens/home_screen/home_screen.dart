import 'package:final_project/app/app_colors.dart';
import 'package:final_project/app/app_words.dart';
import 'package:final_project/data/cubits/popular_cubit/popular_cubit.dart';
import 'package:final_project/presentaion/screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/home_screen_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PopularCubit.get(context).getPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          AppWords.popularList,
        ),
      ),
      body: BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {
          state is PopularError ? debugPrint(AppWords.errorHappened) : null;
        },
        builder: (context, state) {
          return state is PopularLoading
              ? const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.kPrimaryColor),
                )
              : Padding(
                  padding: EdgeInsets.all(8.h),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => DetailsScreen(
                                name: PopularCubit.get(context)
                                        .popularModel
                                        .results![index]
                                        .name ??
                                    AppWords.noName,
                                id: int.parse(PopularCubit.get(context)
                                    .popularModel
                                    .results![index]
                                    .id
                                    .toString()),
                              ),
                            ),
                          );
                        },
                        child: HomeScreenCard(
                            name: PopularCubit.get(context)
                                    .popularModel
                                    .results![index]
                                    .name ??
                                AppWords.noName),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 14.h,
                      );
                    },
                    itemCount:
                        PopularCubit.get(context).popularModel.results!.length,
                  ),
                );
        },
      ),
    );
  }
}
