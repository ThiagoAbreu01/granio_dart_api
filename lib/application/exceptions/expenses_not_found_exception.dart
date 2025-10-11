// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExpensesNotFoundException implements Exception {
  final String? message;
  ExpensesNotFoundException({
    this.message,
  });
}
