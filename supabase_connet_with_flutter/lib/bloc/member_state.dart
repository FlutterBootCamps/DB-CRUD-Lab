part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}

class LoadingState extends MemberState {}

class DisplayInfoState extends MemberState {
  final List<Member> classMember;
  DisplayInfoState({required this.classMember});
}

class AddMemberState extends MemberState {}
  // final List<Member> member;
  // AddMemberState({required this.member});
// }

class EditMemberState extends MemberState {}
class DeleteMemberState extends MemberState {}

