import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_app/presentation/pages/home/home_page.dart';
import 'package:mobx_app/presentation/pages/login/stores/login_page_store.dart';

class LoginPage extends StatelessWidget {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();
  final _loginPageStore = LoginPageStore();

  _mensagemDeErro(String mensagem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          mensagem,
          style: TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _onPressedParaBotaoAcessar({BuildContext context}) {
    if (_loginPageStore.oFormularioEhValido) {
      return () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobx App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: _emailNode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_senhaNode),
              onChanged: (value) => _loginPageStore.atualizarEmail(value),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  hintText: "Informe o email"),
            ),
            Observer(
              builder: (_) {
                return Visibility(
                  visible: !_loginPageStore.oEmailEhValido,
                  child: _mensagemDeErro("Um email correto é obrigatório"),
                );
              },
            ),
            TextField(
              focusNode: _senhaNode,
              keyboardType: TextInputType.text,
              onChanged: (value) => _loginPageStore.atualizarSenha(value),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.security,
                  ),
                  hintText: "Informe a senha"),
            ),
            Observer(builder: (_) {
              return Visibility(
                visible: !_loginPageStore.aSenhaEhValida,
                child: _mensagemDeErro("A senha é obrigatória"),
              );
            }),
            Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Observer(
                  builder: (_) {
                    return ElevatedButton(
                      child: Text("Acessar"),
                      onPressed: _onPressedParaBotaoAcessar(context: context),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
