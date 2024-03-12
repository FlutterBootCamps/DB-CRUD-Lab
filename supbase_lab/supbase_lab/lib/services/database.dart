import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supbase_lab/model/member_model.dart';

class DBServices {
  final supabase = Supabase.instance.client;

  Future<List<Member>> fetchMember() async {
    final memberData = await supabase.from('member').select('*');
    List<Member> listMember = [];
    for (var element in memberData) {
      listMember.add(Member.fromJson(element));
    }
    return listMember;
  }

  Future addMember({required String name, required String gendar}) async {
    await supabase.from('member').insert({'name': name, 'gendar': gendar});
  }

  Future deleteMember({required int id}) async {
    await supabase.from('member').delete().match({'id': id});
  }

  Future updateMember(
      {required String name, required String gendar, required int id}) async {
    await supabase
        .from('member')
        .update({'name': name, 'gendar': gendar}).match({'id': id});
  }
}
