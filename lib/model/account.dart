class Account {
  final String email;
  final String id;
  final String username;
  final String password;
  final String name;
  final String image;
  final int startcount;
  final String power;
  final String status;

  Account({
    this.email,
    this.id,
    this.username,
    this.password,
    this.name,
    this.image,
    this.startcount,
    this.power,
    this.status,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      name: json['name'],
      image: json['image'],
      startcount: json['startcount'],
      power: json['power'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'name': name,
        'image': image,
        'startcont': startcount,
        'power': power,
        'status': status,
      };
}
