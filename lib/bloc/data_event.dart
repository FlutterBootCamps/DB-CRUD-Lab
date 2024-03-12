part of 'data_bloc.dart';

@immutable
sealed class DataEvent {}

final class GetMemberDataEvent extends DataEvent {

}

final class AddMemberEvent extends DataEvent {
  final String name;
  final String gender;

  AddMemberEvent({required this.gender, required this.name});
}

final class EditMemberEvent extends DataEvent {
  final String name;
  final String gender;
  final Member member;

  EditMemberEvent({required this.gender, required this.member, required this.name});
}

final class DeleteMemberEvent extends DataEvent {
  final Member member;

  DeleteMemberEvent({required this.member});
}