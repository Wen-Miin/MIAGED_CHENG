class User {
  final String login;
  final String password;
  final DateTime birthday;
  final String address;
  final String postalCode;
  final String city;

  User({
    required this.login,
    required this.password,
    required this.birthday,
    required this.address,
    required this.postalCode,
    required this.city,
  });
}