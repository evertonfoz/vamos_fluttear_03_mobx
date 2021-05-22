import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_app/presentation/pages/home/home_page.dart';
import 'package:mobx_app/presentation/pages/login/mobx/login_page_mobx.dart';

class LoginPage extends StatelessWidget {
  // @override
  // _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();
  final _loginPageMobx = LoginPageMobx();

  // String _email = "";
  // String _senha = "";

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

  _oEmailEhValido() {
    if (_loginPageMobx.email.value.trim().length == 0) return false;

    final Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final RegExp regex = RegExp(pattern);

    return regex.hasMatch(_loginPageMobx.email.value);
  }

  _aSenhaEhValida() {
    return _loginPageMobx.senha.value.trim().length > 0;
  }

  _onPressedParaBotaoAcessar({BuildContext context}) {
    if (_oEmailEhValido() && _aSenhaEhValida()) {
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
              onChanged: (value) => _loginPageMobx.atualizarEmail([value]),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  hintText: "Informe o email"),
            ),
            Observer(
              builder: (_) {
                return Visibility(
                  visible: !_oEmailEhValido(),
                  child: _mensagemDeErro("Um email correto é obrigatório"),
                );
              },
            ),
            TextField(
              focusNode: _senhaNode,
              keyboardType: TextInputType.text,
              onChanged: (value) => _loginPageMobx.atualizarSenha([value]),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.security,
                  ),
                  hintText: "Informe a senha"),
            ),
            Observer(builder: (_) {
              return Visibility(
                visible: !_aSenhaEhValida(),
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
