import 'dart:developer';
import 'package:final_project/data/requests/popular_request.dart';
import 'package:final_project/domain/models/popular_images_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/popular_details_model.dart';
part 'popular_details_state.dart';

class PopularDetailsCubit extends Cubit<PopularDetailsState> {
  PopularDetailsCubit() : super(PopularDetailsInitial());

  static PopularDetailsCubit get(context) => BlocProvider.of(context);

  PopularDetailsModel popularDetailsModel = PopularDetailsModel();
  PopularImagesModel popularImagesModel =PopularImagesModel();

  getDetails({required int id}) {
    emit(PopularDetailsLoading());
    PopularRequest.getPopularDetails(
        id: id,
        onSuccess: (res) {
          popularDetailsModel = res;
          emit(PopularDetailsDone());
        },
        onError: (int statusCode) {
          emit(PopularDetailsError());
          log(statusCode.toString());
        });
  }
  getImages({required int id}) {
    emit(PopularImageLoading());
    PopularRequest.getPopularImages(
        id: id,
        onSuccess: (res) {
          popularImagesModel = res;
          emit(PopularImageDone());
        },
        onError: (int statusCode) {
          emit(PopularImageError());
          log(statusCode.toString());
        });
  }
}
