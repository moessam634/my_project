part of 'popular_details_cubit.dart';


abstract class PopularDetailsState {}

class PopularDetailsInitial extends PopularDetailsState {}
class PopularDetailsLoading extends PopularDetailsState {}
class PopularDetailsDone extends PopularDetailsState {}
class PopularDetailsError extends PopularDetailsState {}
class PopularImageLoading extends PopularDetailsState {}
class PopularImageDone extends PopularDetailsState {}
class PopularImageError extends PopularDetailsState {}
