import 'package:intl/intl.dart';
import 'package:mysql1/mysql1.dart';
import 'package:granio_dart_api/entities/history.dart';

class HistoryQuery {
  static Future<Results?> addHistory(
      MySqlConnection? conn, History history) async {
    var results = await conn?.query(
      'INSERT INTO history VALUES (?, ?, ?, ?, ?, ?)',
      [
        null,
        history.user ?? null,
        history.action,
        history.amount,
        DateFormat('dd/MM/yyyy').format(DateTime.now()),
        DateFormat('HH:mm:ss').format(DateTime.now()),
      ],
    );
    return results;
  }
}
