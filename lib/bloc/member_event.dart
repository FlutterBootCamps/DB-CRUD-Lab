// ignore_for_file: must_be_immutable

part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}
class FachDataEvent extends MemberEvent{}
class DeleteRowEvent  extends MemberEvent{
  int  id;
  DeleteRowEvent(this.id);
}
class EditRowEvent extends MemberEvent{
  String name;
  String gender;
  int id;
  EditRowEvent({required this.name,required this.gender,required this.id});
}
class InsertRowEvent extends MemberEvent{
  String name;
  String gender;
  InsertRowEvent(this.name,this.gender);
}


