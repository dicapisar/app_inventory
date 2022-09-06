class LoginResponse {
  final int id;
  final String name;
  final String rolName;
  final String idSession;

  const LoginResponse(
      {required this.id,
      required this.name,
      required this.rolName,
      required this.idSession});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        id: json['id'],
        name: json['name'],
        rolName: json['rolName'],
        idSession: json['idSession']);
  }
}
