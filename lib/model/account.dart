class Account {
  final String email;
  final String id;
  final String username;
  final String password;
  final String name;
  final String image;
  final int startcont;
  final String power;
  final String status;

  Account({
    this.email,
    this.id,
    this.image,
    this.name,
    this.password,
    this.power,
    this.startcont,
    this.status,
    this.username,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      name: json['name'],
      image: json['image'],
      startcont: json['startcount'],
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
        'startcont': startcont,
        'power': power,
        'status': status,
      };
}
