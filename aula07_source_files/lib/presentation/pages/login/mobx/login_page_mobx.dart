import 'package:mobx/mobx.dart';

class LoginPageMobx {
  Observable<String> email = Observable('');
  Observable<String> senha = Observable('');

  Action atualizarEmail;
  Action atualizarSenha;

  LoginPageMobx() {
    atualizarEmail = Action(_atualizarEmail);
    atualizarSenha = Action(_atualizarSenha);
  }

  _atualizarEmail(String novoEmail) {
    email.value = novoEmail;
  }

  _atualizarSenha(String novaSenha) {
    senha.value = novaSenha;
  }
}
