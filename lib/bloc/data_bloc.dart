import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_week7_day3/models/member_model.dart';
import 'package:flutter_week7_day3/services/db_service.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {

    on<GetMemberDataEvent>(getAllMemberData);
    on<AddMemberEvent>(addMember);
    on<EditMemberEvent>(editMember);
    on<DeleteMemberEvent>(deleteMember);
  }

  FutureOr<void> getAllMemberData(GetMemberDataEvent event, Emitter<DataState> emit) async{
    emit(LoadingState());

    try {
      await Future.delayed(const Duration(seconds: 1));
      List<Member> memberList = await serviceLocator.fetchMemberData();
      emit(DataRecivedState(memberList: memberList));
    } catch (e) {
      print(e);
      emit(DataErrorState(msg: "Error in getting data from server."));
    }
    
  }

  FutureOr<void> addMember(AddMemberEvent event, Emitter<DataState> emit) async{
    if (event.name.trim().isNotEmpty && event.gender.trim().isNotEmpty && (event.gender.toLowerCase() == 'male' || event.gender.toLowerCase() == 'female')) {
      try {
      serviceLocator.insertData(name: event.name, gender: event.gender);
      emit(DatabaseModifiedState(msg: "Succesfuly added ${event.name} to database."));
    }catch(e) {
      print(e);
      emit(DataErrorState(msg: "Error in adding this member"));
    }
    } else {
      emit(DataErrorState(msg: "Make sure you fill both name and gender, and fill gender with [male, female]"));
    }
  }

  FutureOr<void> editMember(EditMemberEvent event, Emitter<DataState> emit) {
    if (event.name.trim().isNotEmpty && event.gender.trim().isNotEmpty && (event.gender.toLowerCase() == 'male' || event.gender.toLowerCase() == 'female')) {
      try {
      serviceLocator.editData(member: event.member, name: event.name, gender: event.gender);
      emit(DatabaseModifiedState(msg: "Succesfuly changed ${event.member.name}'s name to ${event.name} and gender to ${event.gender}."));
      Future.delayed(const Duration(seconds: 1));
    }catch(e) {
      print(e);
      emit(DataErrorState(msg: "Error editing this member's info"));
    }
    } else {
      emit(DataErrorState(msg: "Make sure you fill both name and gender, and fill gender with [male, female]"));
    }
  }

  FutureOr<void> deleteMember(DeleteMemberEvent event, Emitter<DataState> emit) {
    try {
      serviceLocator.deleteData(member: event.member);
      emit(DatabaseModifiedState(msg: "${event.member.name} has been removed from the database."));
      Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      print(e);
      emit(DataErrorState(msg: "Error in removing this member from the database"));
    }
  }
}
