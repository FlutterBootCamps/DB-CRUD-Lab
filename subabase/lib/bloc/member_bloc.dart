import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:subabase/data/data_service.dart';
import 'package:subabase/utils/setup.dart';
import 'package:subabase/model/members.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final serviceLocator = DataClass().locator.get<DBService>();
  MemberBloc() : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchDataEvent>(
      (event, emit) async {
        emit(DisplayState(listData: await serviceLocator.FetchData()));
      },
    );

    on<AddMemberEvent>(
      (event, emit) async {
        await serviceLocator.createData(event.name, event.gender);
        emit(DisplayState(listData: await serviceLocator.FetchData()));
      },
    );

    on<DeleteMemberEvent>(
      (event, emit) async {
        await serviceLocator.deleteData(event.member);
        emit(DisplayState(listData: await serviceLocator.FetchData()));
      },
    );

    on<UpdateMemberEvent>(
      (event, emit) async {
        await serviceLocator.updateData(event.id, event.name, event.gender);
        emit(DisplayState(listData: await serviceLocator.FetchData()));
      },
    );
  }
}
