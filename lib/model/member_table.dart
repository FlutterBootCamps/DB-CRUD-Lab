class Member {
  final int id;
  final String name;
  final String gender;

  Member({required this.id, required this.name, required this.gender});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
    };
  }
}
