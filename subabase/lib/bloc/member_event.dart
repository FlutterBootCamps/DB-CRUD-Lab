part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}

class FetchDataEvent extends MemberEvent {}

class AddMemberEvent extends MemberEvent {
  String name;
  String gender;
  AddMemberEvent({required this.name, required this.gender});
}

class DeleteMemberEvent extends MemberEvent {
  final Member member;
  DeleteMemberEvent({required this.member});
}

class UpdateMemberEvent extends MemberEvent {
  int id;
  String name;
  String gender;
  UpdateMemberEvent(this.id, {required this.name, required this.gender});
}
