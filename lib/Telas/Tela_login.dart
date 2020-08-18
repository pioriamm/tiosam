import 'package:flutter/material.dart';
import 'package:tiosam/Telas/home.dart';
import 'package:tiosam/help.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool openloginpainel = true;
  int i = 0;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        openloginpainel = !openloginpainel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var tela = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: tela.height,
            width: tela.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      openloginpainel = !openloginpainel;
                      print(openloginpainel);
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 2,
                        width: tela.width - 100,
                        color: Colors.white,
                      ),
                      Container(
                        height: 150,
                        width: tela.width - 100,
                        child: Image.asset(
                          "Imagens/assets/cima.png",
                          //fit: BoxFit.cover,
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        height: openloginpainel ? 0 : 205,
                        width: tela.width - 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "E-mail",
                                ),
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Senha",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: FlatButton(
                                    onPressed: () {
                                      proximapagina(context, Home());
                                    },
                                    child: Text("Entrar")),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: tela.width - 100,
                        child: Image.asset(
                          "Imagens/assets/baixo.png",
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
