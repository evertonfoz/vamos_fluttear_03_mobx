// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginPageStore on _LoginPageStore, Store {
  Computed<bool> _$oEmailEhValidoComputed;

  @override
  bool get oEmailEhValido =>
      (_$oEmailEhValidoComputed ??= Computed<bool>(() => super.oEmailEhValido,
              name: '_LoginPageStore.oEmailEhValido'))
          .value;
  Computed<bool> _$aSenhaEhValidaComputed;

  @override
  bool get aSenhaEhValida =>
      (_$aSenhaEhValidaComputed ??= Computed<bool>(() => super.aSenhaEhValida,
              name: '_LoginPageStore.aSenhaEhValida'))
          .value;
  Computed<bool> _$oFormularioEhValidoComputed;

  @override
  bool get oFormularioEhValido => (_$oFormularioEhValidoComputed ??=
          Computed<bool>(() => super.oFormularioEhValido,
              name: '_LoginPageStore.oFormularioEhValido'))
      .value;

  final _$emailAtom = Atom(name: '_LoginPageStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_LoginPageStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$_LoginPageStoreActionController =
      ActionController(name: '_LoginPageStore');

  @override
  dynamic atualizarEmail(String novoValor) {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction(
        name: '_LoginPageStore.atualizarEmail');
    try {
      return super.atualizarEmail(novoValor);
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizarSenha(String novoValor) {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction(
        name: '_LoginPageStore.atualizarSenha');
    try {
      return super.atualizarSenha(novoValor);
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
oEmailEhValido: ${oEmailEhValido},
aSenhaEhValida: ${aSenhaEhValida},
oFormularioEhValido: ${oFormularioEhValido}
    ''';
  }
}
