import 'package:flutter/material.dart';
import 'package:mobx_app/presentation/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();
  String _email = "";
  String _senha = "";

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
    if (_email.trim().length == 0) return false;

    final Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final RegExp regex = RegExp(pattern);

    return regex.hasMatch(_email);
  }

  _aSenhaEhValida() {
    return _senha.trim().length > 0;
  }

  _onPressedParaBotaoAcessar() {
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
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  hintText: "Informe o email"),
            ),
            Visibility(
              visible: !_oEmailEhValido(),
              child: _mensagemDeErro("Um email correto é obrigatório"),
            ),
            TextField(
              focusNode: _senhaNode,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  _senha = value;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.security,
                  ),
                  hintText: "Informe a senha"),
            ),
            Visibility(
              visible: !_aSenhaEhValida(),
              child: _mensagemDeErro("A senha é obrigatória"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: ElevatedButton(
                child: Text("Acessar"),
                onPressed: _onPressedParaBotaoAcessar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
