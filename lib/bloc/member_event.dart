part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}

class fetchDataEvent extends MemberEvent {}

class deleteDataEvent extends MemberEvent {
  Member member;
  deleteDataEvent(this.member);
}

class addMemberEvent extends MemberEvent {
  Member member;
  addMemberEvent(this.member);
}
 

class editMemberEvent extends MemberEvent{
   Member member;
  editMemberEvent(this.member);
}