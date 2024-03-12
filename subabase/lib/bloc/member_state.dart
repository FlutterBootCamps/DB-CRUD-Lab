part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}

class DisplayState extends MemberState {
  List<Member> listData = [];

  DisplayState({required this.listData});
}
