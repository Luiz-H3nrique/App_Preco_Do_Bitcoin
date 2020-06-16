import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _preco = "0";

void _recuperarPreco ()async{
  String url = "https://blockchain.info/ticker";
  http.Response response = await http.get(url);

  Map<String, dynamic> retorno = json.decode(response.body);
  print("resultado :" + retorno["BRL"]["buy"].toString());

  setState(() {
    _preco = retorno["BRL"]["buy"].toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      

        body: Center(

          child:Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            child:Column(
              
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             
            Image.asset('imagens/bitcoin.png'),

              SizedBox(height: 20,),
              Text( "R\$ ${_preco}",
                style: TextStyle(
                  fontSize:35,
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(onPressed:_recuperarPreco,
              color: Colors.orange,
                child: Text("Atualizar",
                style: TextStyle(
                  color:Colors.white,
                ),
                ),
              ),
          ],)
        ),
        )
    );
      
    
  }
}