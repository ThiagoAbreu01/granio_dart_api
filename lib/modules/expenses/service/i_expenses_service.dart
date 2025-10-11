import 'package:granio_dart_api/entities/expense.dart';

abstract interface class IExpensesService {
  Future<void> addExpense(Expense expense);
  Future<void> deleteExpense(String expenseId);
  Future<Expense?> getExpenseById(String expenseId);
  Future<List<Expense>> getExpensesByWalletId(int walletId);
  Future<Expense> updateExpense(Expense expense);
}
