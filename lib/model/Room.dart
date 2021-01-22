class Room {
  final String id;
  final int p1score;
  final int p2score;
  final String player1;
  final String player2;
  final int qNumber;

  Room(
      {this.id,
      this.p1score,
      this.p2score,
      this.player1,
      this.player2,
      this.qNumber});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
        id: json['id'],
        p1score: json['p1score'],
        p2score: json['p2score'],
        player1: json['player1'],
        player2: json['player2'],
        qNumber: json['qNumber']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'p1score': p1score,
        'p2score': p2score,
        'player1': player1,
        'player2': player2,
        'qNumber': qNumber
      };
}
