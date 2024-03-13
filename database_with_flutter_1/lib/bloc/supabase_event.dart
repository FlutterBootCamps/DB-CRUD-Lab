part of 'supabase_bloc.dart';

@immutable
sealed class SupabaseEvent {}

class FetchDataEvent extends SupabaseEvent {}

class AddMemberEvent extends SupabaseEvent {
  final String name;
  final String gender;
  AddMemberEvent({required this.name, required this.gender});
}

class EditMemberEvent extends SupabaseEvent {
  final String name;
  final String gender;
  final int id;
  EditMemberEvent({required this.name, required this.gender, required this.id});
}

class DeleteMemberEvent extends SupabaseEvent {
  final int id;
  DeleteMemberEvent({required this.id});
}
