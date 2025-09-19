import 'dart:convert';

class User{
  final String username;
  final String email;
  final String password;

  User({required this.username, required this.email, required this.password});
  User.f({this.username = "", this.email = "", this.password = ""});

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password
    };
  }

  User copyWith({
    String? username,
    String? email,
    String? password,
  }){
    return User(username: username ?? this.username, email: email ?? this.email, password: password ?? this.password);
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(username: map['username'] ?? '', email: map['email'] ?? '', password: map['password'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
    User.fromMap(json.decode(source) as Map<String, dynamic>);
  
  @override
  String toString(){
    return 'User(username: $username, email: $email, password: $password)';
  }
}
