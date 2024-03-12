part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}

class FetchDataEvent extends MemberEvent {}

class AddMemberDataEvent extends MemberEvent {
  // final Member member;
  final String name;
  final String gender;

  AddMemberDataEvent({ required this.name, required this.gender});
}

class UpdateMemberDataEvent extends MemberEvent {
  // final Member member;
   final String name;
  final String gender;
  final int id;
  UpdateMemberDataEvent({ required this.name, required this.gender, required this.id});
}

class DeleteMemberDataEvent extends MemberEvent {
  final Member member;
  DeleteMemberDataEvent({ required this.member});
}


