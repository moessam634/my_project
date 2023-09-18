import 'dart:developer';
import 'package:final_project/data/requests/popular_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/popular_model.dart';
part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  static PopularCubit get(context) => BlocProvider.of(context);
  PopularModel popularModel = PopularModel();
  getPopular() {
    emit(PopularLoading());
    PopularRequest.getPopular(onSuccess: (res) {
      popularModel = res;
      emit(PopularDone());
    }, onError: (int statusCode) {
      emit(PopularError());
      log(statusCode.toString());
    });
  }
}
