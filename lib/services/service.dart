import 'dart:ffi';

import 'package:supabase__lab/models/member_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DataService {
  final supabase = Supabase.instance.client;

  Future<List<Member>> fetchMembers() async {
    // print("Entered func");
    final memberData = await supabase.from('members').select('*');
    // print("Fiish fetching");
    List<Member> classMembers = [];

    for (var element in memberData) {
      // print("Entered loop");

      classMembers.add(Member.fromJson(element));
    }
    return classMembers;
  }

  Future deleteMember(Member member) async {
    await supabase.from('members').delete().match({'id': member.id});
  }

  Future<void> addMember(Member member) async {
    await supabase
        .from('members')
        .insert({'name': member.name, 'gender': member.gender});
  }

  Future editMember (Member member) async {
    await supabase
  .from('members')
  .update({ 'name': member.name , 'gender':member.gender })
  .match({ 'id': member.id });

  }
}
