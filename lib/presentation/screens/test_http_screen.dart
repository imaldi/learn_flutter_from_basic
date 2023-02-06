import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter_from_basic/model/pokemon.dart';

class TestHttpScreen extends StatefulWidget {
  const TestHttpScreen({Key? key}) : super(key: key);

  @override
  _TestHttpScreenState createState() => _TestHttpScreenState();
}

class _TestHttpScreenState extends State<TestHttpScreen> {
  Future<PokemonModel> getPokemonWithName(String pokemonName) async {
    var response =
        await http.get(Uri.https("pokeapi.co", "/api/v2/pokemon/$pokemonName"));
    print(
        "response code: ${response.statusCode}"); // ini kode berhasil atau nggak nya permintaan kita ke server
    print(
        "response body: ${response.body}"); // ini isi nilai yg di dapat dari server (tergantung suksesnya, response body nya beda)

    if (response.statusCode == 200) {
      // String
      var responseBody = response.body;
      // rubah jadi Map, supaya bisa di proses sama .fromJson
      var decodedMapResponseBody = jsonDecode(
          responseBody); // ini ngerubah String response server menjadi Map<key,value> di dart
      print(
          "Response Body Ability ${decodedMapResponseBody["abilities"]}"); // bisa di akses sebagai Map, tapi lebih baik jadikan class
      var pokemonModel = PokemonModel.fromJson(
          jsonDecode(responseBody)); // ini merubah dari Map<> menjadi Class
      return pokemonModel;
    } else {
      return PokemonModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test HTTP")),
      body: FutureBuilder(
        /// widget khusus untuk melakukan function yang berupa Future (hasilnya ga langsung dapat)
        future: getPokemonWithName("pikachu"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nama: ${snapshot.data?.name ?? "Failed"}"),
                    Text(
                        "Species: ${snapshot.data?.species?.name ?? "Failed"}"),
                    Text("Height: ${snapshot.data?.height ?? "Failed"}"),
                  ],
                ),
              ),
            );
          }
          return Center(child: Text("Loading..."));
        },
      ),
    );
  }
}
