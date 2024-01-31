class User {
  User({
    required this.name,
    required this.uid,
  });

  final String name;
  final String uid;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
    };
  }

  toJson() {
    return {
      'uid': uid,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      uid: map['uid'],
    );
  }
}
