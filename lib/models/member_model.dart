
class Member {
  final int id;
  final String name;
  final String gender;

  Member({
    required this.id,
    required this.name,
    required this.gender,
  });

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      id: map['id'],
      name: map['name'],
      gender: map['gender'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
    };
  }
}
