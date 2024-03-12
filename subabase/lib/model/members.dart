class Member {
  late int id;
  late String name;
  late String gender;

  Member({required this.id,required this.name, required this.gender});

  // Factory constructor to create a Member instance from a map (e.g., from database query result)
  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      id: map['ID'],
      name: map['Name'],
      gender: map['Gender'],
    );
  }

  // Factory constructor to create a Member instance from JSON
  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
    );
  }

  // Getter to retrieve a map representation of the Member instance (e.g., for database insertion)
  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Gender': gender,
    };
  }

  // Convert Member instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
    };
  }
}