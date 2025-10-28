import 'package:injectable/injectable.dart';
import 'package:granio_dart_api/entities/expense.dart';

import './i_expenses_service.dart';

@Injectable(as: IExpensesService)

class ExpensesService implements IExpensesService {
  @override
  Future<void> addExpense(Expense expense) {
    // TODO: implement addExpense
    throw UnimplementedError();
  }

  @override
  Future<void> deleteExpense(String expenseId) {
    // TODO: implement deleteExpense
    throw UnimplementedError();
  }

  @override
  Future<Expense?> getExpenseById(String expenseId) {
    // TODO: implement getExpenseById
    throw UnimplementedError();
  }
  
  @override
  Future<List<Expense>> getExpensesByWalletId(int walletId) {
    // TODO: implement fetchExpensesByWalletId
    throw UnimplementedError();
  }


  @override
  Future<Expense> updateExpense(Expense expense) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }

}