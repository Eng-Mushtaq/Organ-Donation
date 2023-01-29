class User {
  int? id, estate, usertype;
  String? username, password;
  List<User>? _users;
  List<User>? get users => _users;
  User({this.id, this.username, this.password, this.usertype, this.estate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    usertype = json['usertype'];
    estate = json['estate'];
    if (json['users'] != null) {
      _users = <User>[];
      json['users'].forEach((v) {
        users!.add(new User.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['usertype'] = usertype;
    data['estate'] = estate;

    return data;
  }
}
