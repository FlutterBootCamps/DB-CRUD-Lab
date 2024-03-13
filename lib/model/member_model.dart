
class Member {
  final int id;
  final String names;
  final String gender;

  Member({
    required this.id,
    required this.names,
    required this.gender,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as int,
      names: json['names'] as String,
      gender: json['gender'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'names': names,
      'gender': gender,
    };
  }
}