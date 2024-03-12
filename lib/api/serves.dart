import 'package:connect_suba_and_fluttter/model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class serves{
  final supabase=Supabase.instance.client;

  Future<List<Member>> getMembers() async{
    final memberData=await supabase.from('member').select('*');
    List<Member> members=[];
    memberData.forEach((member) {
      members.add(Member.fromMap(member));
    });
    return members;
  }

    Future insertData(String name,String gender) async {
    await supabase
        .from('member')
        .insert([
          {'name': name, 'gender': gender},
        ])
        .select();
}


Future deleteData(int id) async {
    await supabase
        .from('member')
        .delete()
        .eq('id',id);
}
Future updateData(int id,String new_name,String new_gender) async {
    await supabase
        .from('member')
        .update({'name' : new_name, 'gender': new_gender})
        .eq('id',id);
}
}