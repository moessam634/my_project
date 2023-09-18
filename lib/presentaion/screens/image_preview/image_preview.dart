import 'package:final_project/app/app_constants.dart';
import 'package:final_project/app/app_words.dart';
import 'package:final_project/data/cubits/popular_details_cubit/popular_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/app_colors.dart';

// ignore: must_be_immutable
class ImagePreview extends StatelessWidget {
  ImagePreview({
    Key? key,
    required this.path,
    required this.height,
    required this.width,
  }) : super(key: key);
  String path;
  num width, height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.kPrimaryColor,
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.download))
        ],
      ),
      body: BlocConsumer<PopularDetailsCubit, PopularDetailsState>(
          listener: (context, state) {
        state is PopularImageError ? debugPrint(AppWords.errorHappened) : null;
      }, builder: (context, state) {
        return state is PopularImageLoading
            ? const Center(
                child:
                    CircularProgressIndicator(color: AppColors.kPrimaryColor),
              )
            : ListView(
                children: [
                  Image.network(
                    AppConstants.imageBaseUrl + path,
                    height: double.parse(height.toString()),
                    width: double.parse(width.toString()),
                    errorBuilder: (context, error, stackTrace) =>
                        const Text('Your error widget...'),
                  )
                ],
              );
      }),
    );
  }
}
