import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Expense {
  final int id;
  final int userId;
  final int walletId;
  final int categoryId;
  final double amount;
  final String description;
  final DateTime createdAt;
  Expense({
    required this.id,
    required this.userId,
    required this.walletId,
    required this.categoryId,
    required this.amount,
    required this.description,
    required this.createdAt,
  });


  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'wallet_id': walletId,
      'category_id': categoryId,
      'amount': amount,
      'description': description,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      walletId: map['wallet_id'] as int,
      categoryId: map['category_id'] as int,
      amount: map['amount'] as double,
      description: map['description'] as String,
      createdAt: map['created_at'] as DateTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) => Expense.fromMap(json.decode(source) as Map<String, dynamic>);
}
