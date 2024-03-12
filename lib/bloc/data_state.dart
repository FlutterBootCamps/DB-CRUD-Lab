part of 'data_bloc.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}

final class DataRecivedState extends DataState {
  final List<Member> memberList;

  DataRecivedState({required this.memberList});
}

final class DataErrorState extends DataState {
  final String msg;

  DataErrorState({required this.msg});
}

final class LoadingState extends DataState {

}

final class DatabaseModifiedState extends DataState {
  final String msg;

  DatabaseModifiedState({required this.msg});
}