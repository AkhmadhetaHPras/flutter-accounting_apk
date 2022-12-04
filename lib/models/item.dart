class Item {
  int? id;
  String label;
  String date;
  String time;
  int? cashIn;
  int? cashOut;

  Item({
    this.id,
    required this.label,
    required this.date,
    required this.time,
    this.cashIn,
    this.cashOut,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'label': label});
    result.addAll({'date': date});
    result.addAll({'time': time});
    result.addAll({'cashin': cashIn});
    result.addAll({'cashout': cashOut});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      label: map['label'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      cashIn: map['cashin'],
      cashOut: map['cashout'],
    );
  }
}
