import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/Gif.dart';
import 'package:http/http.dart' as http;
import 'package:prompt_dialog/prompt_dialog.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {
  late Future<List<Gif>> _listadoGifs;

  Future<List<Gif>> _getGifs() async {
    final response = await http.get(Uri.parse(
        // "https://api.giphy.com/v1/gifs/search?api_key=eVZUp7qgVEJ9O5TzIEOFmruzVkk2YALM&q=anime&limit=18&offset=0&rating=g&lang=en"
        "https://api.jikan.moe/v3/genre/anime/1/1"));

    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      // for (var item in jsonData["data"]) {
      //   gifs.add(Gif(item["title"], item["images"]["downsized"]["url"]));
      // }
      for (var item in jsonData["anime"]) {
        gifs.add(Gif(item["title"], item["image_url"], item["synopsis"]));
      }

      return gifs;
    } else {
      throw Exception("Falló la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: _listadoGifs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 1,
                children: _listGifs(snapshot.data),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("Error");
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        backgroundColor: Colors.grey.shade900);
  }

  List<Widget> _listGifs(data) {
    List<Widget> gifs = [];

    for (var gif in data) {
      gifs.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Card(
            color: Colors.grey[800],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ListTile(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'info',
                          style: TextStyle(color: Colors.grey),
                        ),
                        content: Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              '${gif.info}',
                              style: (TextStyle(color: Colors.grey[200])),
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                        backgroundColor: Colors.grey[800],
                      ),
                    ),
                    title: Text(
                      gif.name,
                      style: TextStyle(color: Colors.grey[300], fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                    child: Image.network(
                  gif.url,
                  fit: BoxFit.fill,
                ))
              ],
            )),
      ));
    }

    return gifs;
  }
}
