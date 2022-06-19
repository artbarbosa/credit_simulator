class UserModel {
  final String fullName;
  final String email;
  UserModel({
    required this.fullName,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fullName': fullName});
    result.addAll({'email': email});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
    );
  }

  UserModel copyWith({
    String? fullName,
    String? email,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }
}
