import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class PhotoScreen extends StatelessWidget {
  var data;

  String searchPhoto;

  PhotoScreen({required this.searchPhoto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  leading: Icon(Icons.arrow_back,color: Colors.black,),
      ),
      body: FutureBuilder(
        future: getPhoto(search: searchPhoto),
        builder: (context, photo) {
          var f;
          if (photo.hasData) {
            f = ListView.builder(
              itemCount: data['hits'].length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(15),
                child: Image.network(
                    data['hits'][index]['largeImageURL'].toString()),
              ),
            );
          } else if (photo.hasError) {
            f = const Center(child: Text(' Error Not Found  '));
          } else if (!photo.hasData) {
            f = const Center(
              child: CircularProgressIndicator(),
            );
          }
          return f;
        },
      ),
    );
  }

  Future<Map> getPhoto({required String search}) async {
    Uri url = Uri.parse(
        'https://pixabay.com/api/?key=25883494-329254f697e1b6aacc43b87ce&q=$search&image_type=photo&pretty=true');
    http.Response response = await http.get(url);
    data = await json.decode(response.body);

    print('sddd');
    return json.decode(response.body);
  }
}
