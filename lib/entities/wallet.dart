import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Wallet {
  final int? id;
  final String name;
  final double amount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Wallet({
    this.id,
    required this.name,
    required this.amount,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'amount': amount,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map['id'] as int?,
      name: map['name'] as String,
      amount: map['amount'] as double,
      createdAt: map['created_at'] as DateTime?,
      updatedAt: map['updated_at'] as DateTime?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) =>
      Wallet.fromMap(json.decode(source) as Map<String, dynamic>);
}
