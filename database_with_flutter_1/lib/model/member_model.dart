
class MemberModel {
  MemberModel({
    required this.id,
    required this.name,
    required this.gender,
  });
  late final int id;
  late final String name;
  late final String gender;
  
  MemberModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['gender'] = gender;
    return _data;
  }
}