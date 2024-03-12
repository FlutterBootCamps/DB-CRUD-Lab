class Member {
  Member({
    required this.id,
    required this.name,
    required this.gendar,
  });
  late final int id;
  late final String name;
  late final String gendar;
  
  Member.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    gendar = json['gendar'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['gendar'] = gendar;
    return _data;
  }
}