part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}
// ignore: must_be_immutable
class DisplayInfoState extends MemberState{
  List <Member> classMember = [];
  DisplayInfoState(this.classMember);
}
class LoadingState extends MemberState{

}