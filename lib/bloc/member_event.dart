part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}

class gitDataEvent extends MemberEvent {
  
}
class addMember extends MemberEvent {
  String name;
  String gender;
  addMember(this.name,this.gender);
}
class deleteMember extends MemberEvent {
  int id;
  deleteMember(this.id);
}
class updateMember extends MemberEvent {
  int id;
  String name;
  String gender;
  updateMember(this.id,this.name,this.gender);
}
