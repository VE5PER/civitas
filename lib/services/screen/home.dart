/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var uri = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=aed2bd3bd2fa4012bea91fe0447cb0d1');
    return Scaffold(
      appBar: AppBar(
        title: Text('Civitas News'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: http.get(uri),
        builder: (context,newsdata) => ListView.builder(
          itemCount: json.decode(newsdata.data.body)['articles'].length,
          itemBuilder: (context,index) {
            return Card(
            child: Column(children: <Widget>[
                Image.network(json.decode(newsdata.data.body)['articles'][index]['urlToImage'],
                ),
               Text(json.decode(newsdata.data.body)['articles'][index]['title']), 
            ],
            ),
          );
          }
          
          )
            
            )
        );
      
      
    
  }
}*/
