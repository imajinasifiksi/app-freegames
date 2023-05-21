import 'dart:convert';
import 'package:flutter/material.dart';
import '../utils/logger.dart';
import '../model/freegames.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Future<List<Welcome>> _getData() async {
    List<Welcome> freegames = [];
    try {
      var response = await http.get(
        Uri.parse(
          "https://www.freetogame.com/api/games",
        ),
      );
      List data = jsonDecode(response.body);
      for (var element in data) {
        freegames.add(Welcome.fromJson(element));
      }

      logger.d(freegames.length);
    } catch (e) {
      logger.d(e);
      logger.d('error');
    }

    return freegames;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreeGames', style: TextStyle(
            fontSize: 18,
            fontFamily: 'Sans-Serif',
            fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                List<Welcome> freegames = snapshot.data;
                return GestureDetector(
                  child: ListTile(
                    onTap: () {
                      launchUrl(Uri.parse(freegames[index].gameUrl));
                    },
                    leading: CircleAvatar(
                      child: Image.network(
                     '${freegames[index].thumbnail}'),
                    ),
                    title: Text(freegames[index].title),
                    subtitle: Text(
                      freegames[index].shortDescription,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: Icon(
                  Icons.signal_cellular_connected_no_internet_0_bar,
                ),
              ),
              Center(child: Text("Tidak Ada Koneksi Internet"))
            ],
          );
        },
      ),
    );
  }
}