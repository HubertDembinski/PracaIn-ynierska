class User {
  String id;
  final String email;
  String name;
  String lastName;
  String phoneNumer;

  User({
    this.id = '',
    required this.email,
    this.name = '',
    this.lastName = '',
    this.phoneNumer = '',
  });

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        name: json['imie'],
        lastName: json['nazwisko'],
        phoneNumer: json['numer telefonu'],
      );
}
