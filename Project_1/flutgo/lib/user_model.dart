class User {
  String name;
  String username;
  String email;
  String password;

  User(
      {required this.name,
      required this.username,
      required this.email,
      required this.password});

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        username = json["username"],
        email = json["email"],
        password = json["password"];
}

class AuthRequest {
  String identity;
  String password;

  AuthRequest({required this.identity, required this.password});

  AuthRequest.fromJson(Map<String, dynamic> json)
      : identity = json["identity"],
        password = json["password"];
}

class AuthResponse {
  String data;
  String message;
  String status;

  AuthResponse(
      {required this.data, required this.message, required this.status});

  AuthResponse.fromJson(Map<String, dynamic> json)
      : data = json["data"],
        message = json["message"],
        status = json["status"];
}
