import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase__lab/models/member_model.dart';
import 'package:supabase__lab/services/data_injection.dart';
import 'package:supabase__lab/services/service.dart';
import 'package:supabase__lab/services/service.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final servicelocater = DataInjection().locater.get<DataService>();

  MemberBloc() : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<fetchDataEvent>(getDta);

    on<deleteDataEvent>((event, emit) async {
      await servicelocater.deleteMember(event.member);
      emit(DisplayInfoState(await servicelocater.fetchMembers()));
    });

    on<addMemberEvent>((event, emit) async {
      await servicelocater.addMember(event.member);
      emit(DisplayInfoState(await servicelocater.fetchMembers()));
    });

    on<editMemberEvent>((event, emit) async {
      await servicelocater.editMember(event.member);
      emit(DisplayInfoState(await servicelocater.fetchMembers()));
    });
  }

  FutureOr<void> getDta(fetchDataEvent event, Emitter<MemberState> emit) async {
    emit(DisplayInfoState(await servicelocater.fetchMembers()));
  }
}
