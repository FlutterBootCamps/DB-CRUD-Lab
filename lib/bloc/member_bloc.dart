import 'package:bloc/bloc.dart';
import 'package:connect_suba_and_fluttter/setup/git_it.dart';
import 'package:connect_suba_and_fluttter/model/model.dart';
import 'package:connect_suba_and_fluttter/api/serves.dart';
import 'package:meta/meta.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<gitDataEvent>((event, emit) async{
      final servesLocator =gitIt().locator.get<serves>();
      emit(MemberShow(await servesLocator.getMembers()));
    },);
        on<addMember>((event, emit) async{
      final servesLocator =gitIt().locator.get<serves>();
      await servesLocator.insertData(event.name,event.gender);
      emit(MemberShow(await servesLocator.getMembers()));
    },);
            on<deleteMember>((event, emit) async{
      final servesLocator =gitIt().locator.get<serves>();
      await servesLocator.deleteData(event.id);
      emit(MemberShow(await servesLocator.getMembers()));
    },);on<updateMember>((event, emit) async{
      final servesLocator =gitIt().locator.get<serves>();
      await servesLocator.updateData(event.id,event.name,event.gender);
      emit(MemberShow(await servesLocator.getMembers()));
    },);
  }
}
