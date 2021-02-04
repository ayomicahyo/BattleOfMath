class Account {
  String email;
  String id;
  String username;
  String password;
  String name;
  String image;
  int startcont;
  String power;
  String status;

  Account(
    String email,
    String id,
    String image,
    String name,
    String password,
    String power,
    int startcont,
    String status,
    String username,
  ) {
    this.email = email;
    this.id = id;
    this.username = username;
    this.password = password;
    this.name = name;
    this.image = image;
    this.startcont = startcont;
    this.status = status;
    this.username = username;
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'id': id,
        'image': image,
        'name': name,
        'password': password,
        'power': power,
        'startcont': startcont,
        'status': status,
        'username': username,
      };
}
