part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}

final class LoadingState extends MemberState {}

final class SuccessState extends MemberState {
  final String msg;
  SuccessState({required this.msg});
}

final class ErrorState extends MemberState {
  final String msg;
  ErrorState({required this.msg});
}

final class DisplayDataState extends MemberState {
  List<Member> members = [];
  DisplayDataState({required this.members});
}
