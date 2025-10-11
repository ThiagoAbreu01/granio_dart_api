import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:granio_dart_api/entities/wallet.dart';
import 'package:granio_dart_api/logger/i_logger.dart';
import 'package:granio_dart_api/modules/wallet/service/i_wallet_service.dart';

part 'wallet_controller.g.dart';

@Injectable()
class WalletController {
  final IWalletService walletService;
  final ILogger log;
  WalletController({
    required this.walletService,
    required this.log,
  });

  @Route.post('/add/<userId>')
  Future<Response> addCategory(Request request, String userId) async {
    try {
      final body = await request.readAsString();
      final wallet = Wallet.fromJson(body);
      await walletService.addWallet(wallet, int.parse(userId));

      return Response.ok('Carteira adicionada com sucesso');
    } catch (e) {
      log.error('Erro ao adicionar Carteira.', e);
      return Response.forbidden(
        'Erro ao adicionar Carteira.',
      );
    }
  }

  Router get router => _$WalletControllerRouter(this);
}
