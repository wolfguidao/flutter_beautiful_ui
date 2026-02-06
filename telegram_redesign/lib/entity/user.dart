import 'dart:convert';

enum UserStatus { online, offline }

class User {
  String userId;
  String avatar;
  String nickname;
  String username;
  String userStatus;
  String mobile;
  String bio;
  String description;
  User({
    required this.userId,
    required this.avatar,
    required this.nickname,
    required this.username,
    required this.userStatus,
    required this.mobile,
    required this.bio,
    required this.description,
  });

  User copyWith({
    String? userId,
    String? avatar,
    String? nickname,
    String? username,
    String? userStatus,
    String? mobile,
    String? bio,
    String? description,
  }) {
    return User(
      userId: userId ?? this.userId,
      avatar: avatar ?? this.avatar,
      nickname: nickname ?? this.nickname,
      username: username ?? this.username,
      userStatus: userStatus ?? this.userStatus,
      mobile: mobile ?? this.mobile,
      bio: bio ?? this.bio,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'avatar': avatar,
      'nickname': nickname,
      'username': username,
      'userStatus': userStatus,
      'mobile': mobile,
      'bio': bio,
      'description': description,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as String,
      avatar: map['avatar'] as String,
      nickname: map['nickname'] as String,
      username: map['username'] as String,
      userStatus: map['userStatus'] as String,
      mobile: map['mobile'] as String,
      bio: map['bio'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(userId: $userId, avatar: $avatar, nickname: $nickname, username: $username, userStatus: $userStatus, mobile: $mobile, bio: $bio, description: $description)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.avatar == avatar &&
        other.nickname == nickname &&
        other.username == username &&
        other.userStatus == userStatus &&
        other.mobile == mobile &&
        other.bio == bio &&
        other.description == description;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        avatar.hashCode ^
        nickname.hashCode ^
        username.hashCode ^
        userStatus.hashCode ^
        mobile.hashCode ^
        bio.hashCode ^
        description.hashCode;
  }
}
