part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}

final class DisplayInfoState extends MemberState {
  List<Member> classMembers = [];
  DisplayInfoState(this.classMembers);
}


