import 'package:subabase/model/members.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  final supabase = Supabase.instance.client;

  Future FetchData() async {
    final memberData = await supabase.from('members').select('*');
    print("Frtched data");
    List<Member> members = [];

    for (var element in memberData) {
      members.add(Member.fromJson(element));
    }
    print("$memberData");

    return members;
  }

  Future createData(String name, String gender) async {
    await supabase.from('members').insert([
      {'name': name, 'gender': gender},
    ]).select();
  }

  Future updateData(int id, String name, String gender) async {
    await supabase
        .from('members')
        .update({'name': name, 'gender': gender}).eq('id', id);
  }

  Future deleteData(Member member) async {
    await supabase.from('members').delete().eq('id', member.id);
  }

}
