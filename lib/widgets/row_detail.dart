import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';

class RowDetail extends StatelessWidget {
  final IconData icone;
  final String texto1;
  final String texto2;
  final Color corIcone;

  const RowDetail(
      {Key key,
      @required this.icone,
      @required this.texto1,
      @required this.texto2,
      @required this.corIcone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 10,
            child: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                border: new Border(
                  right: new BorderSide(width: 1.0, color: kCinzaEscuro),
                ),
              ),
              child: Icon(icone, size: 30, color: corIcone),
            ),
          ),
          Flexible(
            flex: 5,
            child: SizedBox(
              height: 10,
            ),
          ),
          Flexible(
            flex: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  texto1,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'OpenSans',
                      color: kPreto),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  texto2,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 10,
            child: ButtonTheme(
              child: IconButton(
                icon: Icon(
                  Icons.content_copy,
                  size: 30,
                  color: kVermelhoBase,
                ),
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: texto1),
                  );
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("Endereço Copiado"),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
