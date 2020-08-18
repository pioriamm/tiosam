import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiosam/modelos/Sandwiche.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Sandwiches> s = List<Sandwiches>();
  var bd = Firestore.instance;

  @override
  void initState() {
    s.add(Sandwiches(
        nome: "Tio San",
        valor: 13.30,
        fotourl:
            'https://firebasestorage.googleapis.com/v0/b/tiosan-9573d.appspot.com/o/amburger.png?alt=media&token=7500663b-9d62-4e9c-b97f-91dd5a070168',
        ingredientes: ['alface', 'tomate']));
  }

  @override
  Widget build(BuildContext context) {
    var tela = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: bd
              .collection("Listaprodutos")
              .document("eWmopOGRnk7MPj0s4sQn")
              .collection("hamburges")
              .orderBy("valor", descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            List<DocumentSnapshot> documentos = snapshot.data.documents;
            return ListView.builder(
                itemCount: documentos.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: tela.height * 0.22,
                      color: Colors.green,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 10,
                            child: Container(
                              width: 200,
                              child: Image.network(
                                '${s[0].fotourl}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 100,
                            top: 100,
                            child: Container(
                              width: 200,
                              child: documentos[index].data["novo"] == ''
                                  ? null
                                  : Image.network(
                                      "${documentos[index].data["novo"]}"),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${documentos[index].documentID.toUpperCase()}',
                                    style: GoogleFonts.russoOne(
                                        fontSize: 40, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'R\$ ${documentos[index].data["valor"]}',
                                    style: GoogleFonts.russoOne(
                                        fontSize: 25, color: Colors.yellow),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
