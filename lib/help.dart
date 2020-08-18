import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

proximapagina(context, pagina) {
  return Navigator.push(
      context, CupertinoPageRoute(builder: (context) => pagina));
}
