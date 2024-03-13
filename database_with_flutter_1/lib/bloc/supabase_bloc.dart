import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:database_with_flutter_1/model/member_model.dart';
import 'package:database_with_flutter_1/service/setup.dart';
import 'package:database_with_flutter_1/service/suupabase_services.dart';
import 'package:meta/meta.dart';

part 'supabase_event.dart';
part 'supabase_state.dart';

class SupabaseBloc extends Bloc<SupabaseEvent, SupabaseState> {
  late List<MemberModel> members;
  SupabaseBloc() : super(SupabaseInitial()) {
    on<SupabaseEvent>((event, emit) {});
    on<FetchDataEvent>(fetchData);
    on<AddMemberEvent>(addMember);
    on<EditMemberEvent>(editMember);
    on<DeleteMemberEvent>(deleteMember);
  }

  FutureOr<void> fetchData(
      FetchDataEvent event, Emitter<SupabaseState> emit) async {
    try {
      final serviceLocator = DataLayer().locater.get<DBServices>();
      emit(DisplayState(members: await serviceLocator.fetchMember()));
    } catch (error) {
      emit(ErrorState());
    }
  }

  FutureOr<void> addMember(
      AddMemberEvent event, Emitter<SupabaseState> emit) async {
    try {
      final serviceLocator = DataLayer().locater.get<DBServices>();
      serviceLocator.addMember(name: event.name, gender: event.gender);
      emit(DisplayState(members: await serviceLocator.fetchMember()));
    } catch (error) {
      emit(ErrorState());
    }
  }

  FutureOr<void> editMember(
      EditMemberEvent event, Emitter<SupabaseState> emit) async {
    try {
      final serviceLocator = DataLayer().locater.get<DBServices>();
      serviceLocator.editMembers(
          name: event.name, gender: event.gender, id: event.id);
      emit(DisplayState(members: await serviceLocator.fetchMember()));
    } catch (error) {
      emit(ErrorState());
    }
  }

  FutureOr<void> deleteMember(
      DeleteMemberEvent event, Emitter<SupabaseState> emit) async {
    try {
      final serviceLocator = DataLayer().locater.get<DBServices>();
      serviceLocator.deleteMembers(id: event.id);
      emit(DisplayState(members: await serviceLocator.fetchMember()));
    } catch (error) {
      emit(ErrorState());
    }
  }
}
