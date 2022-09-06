class Login {
  final String name;
  final String password;

  Login(
    this.name,
    this.password,
  );

  Map<String, String> toJson() {
    return {'name': name, 'password': password};
  }
}
