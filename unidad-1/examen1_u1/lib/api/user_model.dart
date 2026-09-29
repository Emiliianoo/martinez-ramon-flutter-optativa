class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;

  String get fullName => '$firstName $lastName';

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as Map<String, dynamic>;

    return User(
      id: json['id'] as int,
      firstName: name['firstname'] as String,
      lastName: name['lastname'] as String,
      email: json['email'] as String,
    );
  }
}
