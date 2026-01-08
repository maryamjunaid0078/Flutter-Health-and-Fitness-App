class User {
  int? id;
  String name;
  String email;
  String password;
  int? age;
  String? gender;
  double? height;
  double? weight;
  DateTime? createdAt;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      age: map['age'],
      gender: map['gender'],
      height: map['height'],
      weight: map['weight'],
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
    );
  }
}
