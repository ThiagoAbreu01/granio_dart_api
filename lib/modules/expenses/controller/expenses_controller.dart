import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:granio_dart_api/application/exceptions/expenses_not_found_exception.dart';
import 'package:granio_dart_api/entities/expense.dart';
import 'package:granio_dart_api/logger/i_logger.dart';
import 'package:granio_dart_api/modules/expenses/service/i_expenses_service.dart';

part 'expenses_controller.g.dart';

@Injectable()
class ExpensesController {
  final IExpensesService expensesService;
  final ILogger log;
  ExpensesController({
    required this.expensesService,
    required this.log,
  });

  @Route.get('/wallet/<walletId>')
  Future<Response> getExpensesByWalletId(Request request, String walletId) async {
    try {
      final expenses = await expensesService.getExpensesByWalletId(int.parse(walletId));

      return Response.ok(jsonEncode(expenses.map((e) => e.toMap()).toList()));
    } on ExpensesNotFoundException catch (e) {
      log.error('Erro ao buscar despesas.', e);
      return Response.forbidden(
        jsonEncode({'message': 'Erro ao buscar despesas.'}),
      );
    }
  }

  @Route.post('/add')
  Future<Response> addExpense(Request request) async {
    try {
      final expense =
          Expense.fromJson(jsonDecode(await request.readAsString()));
      await expensesService.addExpense(expense);

      return Response.ok('Despesa adicionada com sucesso');
    } on ExpensesNotFoundException catch (e) {
      log.error('Erro ao buscar despesas.', e);
      return Response.forbidden(
        jsonEncode({'message': 'Erro ao buscar despesas.'}),
      );
    }
  }

  Router get router => _$ExpensesControllerRouter(this);
}
