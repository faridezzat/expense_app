class Transaction {
  int id;
  String title;
  DateTime date;
  double amount;

  Transaction(
      {required this.id,
      required this.title,
      required this.date,
      required this.amount});
}
