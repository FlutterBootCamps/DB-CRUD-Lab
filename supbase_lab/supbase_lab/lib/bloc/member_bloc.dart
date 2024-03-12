import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supbase_lab/model/member_model.dart';
import 'package:supbase_lab/services/data_injection.dart';
import 'package:supbase_lab/services/database.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final serviceLocator = DataInjection().locator.get<DBServices>();

  MemberBloc() : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {});

    on<displayDataEvent>(getData);
    on<AddMemberEvent>(methodAddMember);
    on<DeleteMemberEvent>(methodDeleteMember);
    on<EditMemberEvent>(methodEditMember);
  }

  FutureOr<void> getData(
      displayDataEvent event, Emitter<MemberState> emit) async {
    emit(LoadingState());
    emit(DisplayDataState(members: await serviceLocator.fetchMember()));
  }

  FutureOr<void> methodAddMember(
      AddMemberEvent event, Emitter<MemberState> emit) async {
    if (event.name.trim().isNotEmpty && event.gendar.trim().isNotEmpty) {
      await serviceLocator.addMember(name: event.name, gendar: event.gendar);
      emit(SuccessState(msg: "Member add successfully"));
    } else {
      emit(ErrorState(msg: "Error: Required field is empty"));
    }
      emit(DisplayDataState(members: await serviceLocator.fetchMember()));
  }

  FutureOr<void> methodDeleteMember(
      DeleteMemberEvent event, Emitter<MemberState> emit) async {
    if (event.id == null) {
      emit(ErrorState(msg: "Error: ID not found"));
    } else {
      await serviceLocator.deleteMember(id: event.id);
      emit(SuccessState(msg: "Member deleted successfully"));
    }
      emit(DisplayDataState(members: await serviceLocator.fetchMember()));
  }

  FutureOr<void> methodEditMember(
      EditMemberEvent event, Emitter<MemberState> emit) async {
    if (event.name.trim().isNotEmpty && event.gendar.trim().isNotEmpty) {
      await serviceLocator.updateMember(
          name: event.name, gendar: event.gendar, id: event.id);
      emit(SuccessState(msg: "Member Update successfully"));
    } else {
      emit(ErrorState(msg: "Error: Required field is empty"));
    }
      emit(DisplayDataState(members: await serviceLocator.fetchMember()));
  }
}
