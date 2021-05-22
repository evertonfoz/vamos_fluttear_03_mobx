import 'package:shared_preferences/shared_preferences.dart';

class OrientacaoTotalPedidoPreferences {
  static Future<void> registrarLeituraOrientacao() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("leituraConfirmada", true);
  }

  static Future<bool> verificarSeJaLeuOrientacao() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("leituraConfirmada") ?? false;
  }
}
