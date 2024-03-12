// Flutter model class representing a member
class Member {
  late int id;
  late String name;
  late String gender;

  // Constructor
  Member({required this.id,required this.name, required this.gender});

  // Factory constructor for creating a Member instance from a map
  factory Member.fromMap(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
    );
  }

  // Convert the Member instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
    };
  }
}
