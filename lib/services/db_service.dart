import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_week7_day3/models/member_model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DBSerivce {
  final supabase = Supabase.instance.client;

  Future<List<Member>> fetchMemberData() async {
    final data = await supabase.from('member').select();

    return List.generate(data.length, (index) => Member.fromMap(data[index]));
  }

  void insertData({required String name, required String gender}) async {
    await supabase.from('member').insert({"name": name, 'gender': StringUtils.capitalize(gender)});
  }

  void editData({
    required String name,
    required String gender,
    required Member member,
  }) async {
    await supabase
        .from('member')
        .update({'name': name, 'gender': StringUtils.capitalize(gender)}).match({'id': member.id});
  }

  void deleteData({required Member member}) async {
    await supabase.from('member').delete().match({'id': member.id});
  }
}

final serviceLocator = GetIt.I.get<DBSerivce>();
