part of 'result_bloc.dart';

@immutable

abstract class ResultState{}

abstract class PrescriptionActionState extends ResultState{}

class PrescriptionInitial extends ResultState{}
class ResultfetchingLoadingState extends ResultState {}

class ResultfetchingErrorState extends ResultState {}

class PrescriptionFetchingSuccessfulState extends ResultState{
  final List<ResultModel> results;

  PrescriptionFetchingSuccessfulState({required this.results});
}

