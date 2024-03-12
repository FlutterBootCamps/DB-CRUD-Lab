import 'package:supabase_connet_with_flutter/mobels/member_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBService{

  // Get a reference your Supabase client
  final supabase = Supabase.instance.client;

  // Fetch data
  Future fetchMembers() async{
    final memderData = await supabase.from('member').select(); // or inside select put  //! '*' 
    
    List<Member> classMember = [];

    //  Add member to list
    for(var element in memderData){
      classMember.add(Member.fromJson(element));
    }
    return classMember;
  }

  // Add member 
  Future addMember({required String name, required String gender}) async{
    final addMember = await supabase.from('member').insert({
      'name': name,
      'gender': gender
    }).then((value) => fetchMembers());
    print("Add successfully");
  }

  // Update member
  Future updateMember({required String name, required String gender , required int id}) async{
    final updateMember = await supabase.from('member').update({'name': name, 'gender': gender}).eq('id', id); // .then((value) => fetchMembers());

  }

  // Delete member
  Future deleteMember({required Member member })async{
    final deleteMember = await supabase.from('member').delete().eq('id', member.id).then((value) => fetchMembers());
  }
}