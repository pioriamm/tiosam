import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroProdutos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tela = MediaQuery.of(context);
    final TextEditingController controller_sabor = TextEditingController();
    final TextEditingController controller_tamanho = TextEditingController();
    final TextEditingController controller_url = TextEditingController();
    final TextEditingController controller_valor = TextEditingController();
    String tamanho;
    var bd = Firestore.instance;
    Map<String, dynamic> data;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de pedidos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: tela.size.height / 2,
              width: tela.size.width,
              child: controller_url.text.isEmpty
                  ? Center(
                      child: Icon(
                        Icons.insert_photo,
                        size: 100,
                        color: Colors.grey,
                      ),
                    )
                  : Image.network('${controller_url}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'SABOR',
                    ),
                    controller: controller_sabor,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'URL',
                    ),
                    controller: controller_url,
                  ),
                  TextField(
                    controller: controller_valor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'VALOR',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            tamanho = "P";
                          },
                          child: Text("P"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            tamanho = "M";
                          },
                          child: Text("M"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            tamanho = "G";
                          },
                          child: Text("G"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                width: tela.size.width,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    data = {
                      'sabor': '${controller_sabor.text}',
                      'tamanho': '${controller_tamanho.text}',
                      'url':
                          'https://www.receiteria.com.br/wp-content/uploads/receitas-de-pizza-de-mussarela-1-1200x738.jpg',
                      'valor': '${controller_valor.text}',
                    };

                    print(data);
                    bd
                        .collection("produtos")
                        .document()
                        .collection("pizzas")
                        .document()
                        .setData(data);
                  },
                  child: Text("Enviar"),
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
