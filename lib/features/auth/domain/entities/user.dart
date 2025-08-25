// lib/features/auth/domain/entities/user.dart
class User {
  final String id;
  final String username;
  final String email;
  final String token;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  });

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, token: $token)';
  }
}
