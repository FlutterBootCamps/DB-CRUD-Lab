import 'package:memberlab/model/member_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  final supabase = Supabase.instance.client;

  Future fetchmember() async {
    final memberData = await supabase.from('member').select('*');
  
    List<Member> classMember = [];
    for (var element in memberData) {
      classMember.add(Member.fromJson(element));
    }
     return classMember;
  }
}
