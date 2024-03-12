import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ramadan2/Service/data_injection.dart';
import 'package:ramadan2/api/api.dart';
import 'package:ramadan2/model/member_table.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {});
    on<FachDataEvent>(getData);
    
    on<InsertRowEvent>(
      (event, emit) async {
        final Servicelocator = Datainjection().locator.get<DBService>();
        await Servicelocator.insertData(event.name, event.gender);
        emit(DisplayInfoState(await Servicelocator.fetchMember()));
      },
    );

    on<DeleteRowEvent>(
      (event, emit) async {
        final Servicelocator = Datainjection().locator.get<DBService>();
        await Servicelocator.deleteData(event.id);
        emit(DisplayInfoState(await Servicelocator.fetchMember()));
      },
    );

    on<EditRowEvent>(
      (event, emit) async {
        final Servicelocator = Datainjection().locator.get<DBService>();
        await Servicelocator.updateData(event.name, event.gender, event.id);
        emit(DisplayInfoState(await Servicelocator.fetchMember()));
      },
    );
  }
  FutureOr<void> getData(event, emit) async {
    emit(LoadingState());
    final Servicelocator = Datainjection().locator.get<DBService>();
    emit(DisplayInfoState(await Servicelocator.fetchMember()));
  }
}
