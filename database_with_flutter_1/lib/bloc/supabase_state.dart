part of 'supabase_bloc.dart';

@immutable
sealed class SupabaseState {}

final class SupabaseInitial extends SupabaseState {}

final class ErrorState extends SupabaseState {}

final class DisplayState extends SupabaseState {
  final List<MemberModel> members;

  DisplayState({required this.members});
}
