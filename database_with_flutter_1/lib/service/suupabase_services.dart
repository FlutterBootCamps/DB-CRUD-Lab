import 'package:database_with_flutter_1/model/member_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBServices {
  // get a reference your Supabase client
  final supabase = Supabase.instance.client;

  // fetch data
  Future fetchMember() async {
    final memberData = await supabase.from('member').select('*');
    List<MemberModel> members = [];
    // add member to member list
    for (var element in memberData) {
      members.add(MemberModel.fromJson(element));
    }
    return members;
  }

  Future addMember({required name, required gender}) async {
    await supabase.from('member').insert({'name': name, 'gender': gender});
  }

  Future editMembers({required id, required name, required gender}) async {
    await supabase
        .from('member')
        .update({'name': name, 'gender': gender}).match({'id': id});
  }

  Future deleteMembers({required id}) async {
    await supabase.from('member').delete().match({'id': id});
  }
}
