
import 'dart:async';

import 'package:ramadan2/model/member_table.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class DBService{
  final supabase = Supabase.instance.client;

  //fetch

  Future <List<Member>>fetchMember()async{
    final memberData = await supabase.from('member').select('*');
    List <Member> classMember=[];
    //add member to the list
    for (var element in memberData) {
     classMember.add(Member.fromJson(element));
    }
    return classMember;
  }

Future insertData (String name,String gender)async{
  await supabase.from('member').insert({"name":name,"gender": gender});
}

Future deleteData (int id)async{
  await supabase.from('member').delete().eq('id',id);
}

Future updateData (String name,String gender, int id)async{
  await supabase.from('member').update({'name':name, 'gender':gender}).eq('id', id);
}
}
