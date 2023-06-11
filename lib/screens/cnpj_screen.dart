import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CnpjScreen extends StatefulWidget {
  @override
  _CnpjScreenState createState() => _CnpjScreenState();
}

var maskFormatter = new MaskTextInputFormatter(
    mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});

//TODO: SALVAR USER INPUT
class _CnpjScreenState extends State<CnpjScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Image(
              image: AssetImage('images/logotanis.png'),
              height: 250.0,
              width: 250.0,
            ),
            SizedBox(height: 55.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onSubmitted: (String str) {
                  print(maskFormatter.getUnmaskedText());
                },
                inputFormatters: [maskFormatter],
                maxLength: 18,
                keyboardType: TextInputType.number,
                obscureText: false,
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20.0),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "CNPJ",
                    hintText: "Digite o CNPJ da sua empresa.",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0))),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: kVermelhoBase,
                child: MaterialButton(
                  height: 20,
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {},
                  child: InkWell(
                      child: new Text('Site Tanis Tecnologia',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontFamily: 'BebasNeue', fontSize: 20.0)
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                      onTap: () =>
                          launch('https://tanis.com.br/fale-conosco/')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
