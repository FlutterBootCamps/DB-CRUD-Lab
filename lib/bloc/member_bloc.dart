import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:memberlab/model/member_model.dart';
import 'package:memberlab/services/data_injection.dart';
import 'package:memberlab/services/supabase_service.dart';
import 'package:meta/meta.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(MemberInitial()) {
     on<MemberEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<fetchEvent>(getdata);
  }
  FutureOr<void> getdata(fetchEvent event,emit)async{
    final servicelocator = DataInjection().locator.get<DBService>();

    emit(DisplayState(await servicelocator.fetchmember()));
  }
}
