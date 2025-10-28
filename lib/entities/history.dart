class History {
  int? id;
  String? user;
  String action;
  String amount;
  String? datePTBR;
  String? hora;

  History({
    this.id,
    required this.user,
    required this.action,
    required this.amount,
    this.datePTBR,
    this.hora,
  });
}
