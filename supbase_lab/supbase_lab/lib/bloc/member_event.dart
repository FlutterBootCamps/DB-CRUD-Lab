part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}

class displayDataEvent extends MemberEvent {}

class AddMemberEvent extends MemberEvent {
  String name;
  String gendar;
  AddMemberEvent({required this.gendar, required this.name});
}

class DeleteMemberEvent extends MemberEvent {
  int id;
  DeleteMemberEvent({required this.id});
}

class EditMemberEvent extends MemberEvent {
  String name;
  String gendar;
  int id;
  EditMemberEvent({required this.gendar, required this.name , required this.id});
}
