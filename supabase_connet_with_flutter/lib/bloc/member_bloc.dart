import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_connet_with_flutter/mobels/member_model.dart';
import 'package:supabase_connet_with_flutter/service.dart/data_injection.dart';
import 'package:supabase_connet_with_flutter/service.dart/supabase_service.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {

  // final serviceLocator =  DataInjection().locator.get<DBService>();


  MemberBloc() : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {
      // TODO: implement event handler
    });

  on<FetchDataEvent>(getData);
  on<AddMemberDataEvent>(addMember);
  on<UpdateMemberDataEvent>(updateMember);
  on<DeleteMemberDataEvent>(deleteMember);

  }


  FutureOr<void> getData(FetchDataEvent event, Emitter<MemberState> emit) async{
    emit(LoadingState());
    final serviceLocator =  DataInjection().locator.get<DBService>();
    emit(DisplayInfoState(classMember: await serviceLocator.fetchMembers()));

  }

  FutureOr<void> addMember(AddMemberDataEvent event, Emitter<MemberState> emit) async{
    final servicelocator = DataInjection().locator.get<DBService>();
    await servicelocator.addMember(name: event.name, gender: event.gender );
    emit(AddMemberState());
    emit(LoadingState());
    emit(DisplayInfoState(classMember: await servicelocator.fetchMembers()));
  }

  FutureOr<void> updateMember(UpdateMemberDataEvent event, Emitter<MemberState> emit) async{
    final servicelocator = DataInjection().locator.get<DBService>();
    await servicelocator.updateMember(name: event.name, gender: event.gender, id : event.id);
    emit(LoadingState());
    emit(DisplayInfoState(classMember: await servicelocator.fetchMembers()));
 
  }

  FutureOr<void> deleteMember(DeleteMemberDataEvent event, Emitter<MemberState> emit) async{
    final servicelocator = DataInjection().locator.get<DBService>();
    await servicelocator.deleteMember(member: event.member);
  
    emit(LoadingState());
    emit(DisplayInfoState(classMember: await servicelocator.fetchMembers()));
 
  }
}
