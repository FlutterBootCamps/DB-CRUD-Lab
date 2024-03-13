part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}
final class DisplayState extends MemberState {
   List<Member> memberlist;

  DisplayState( this.memberlist);
}