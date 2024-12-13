
import 'package:fek_api/model/Post_page.dart';
import 'package:fek_api/pages/two_page.dart';
import 'package:fek_api/server/network_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var itms = [];

  @override
  void initState() {
    super.initState();
    _apiList();
  }

  void _apiList() async {
    var response = await Network.GET(Network.API_GET, Network.paramsEmpty());
    try {
      if (response != null) {
        setState(() {
          itms = Network.parsingResponse(response);
        });

        print(response);
      } else {
        print("xato");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test API"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: itms.length,
        itemBuilder: (context, index) {
          final post = itms[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TwoPage(post: post),
                ),
              );
            },
            child: itmsHome(post),
          );
        },
      ),
    );
  }

  Widget itmsHome(Post post) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text("ID: ${post.id}"),
            const SizedBox(height: 10),
             Image.network(post.image),
                // SizedBox.shrink(),
            const SizedBox(height: 10),
            Text("Rating: ${post.rating.toString()}"),
          ],
        ),
      ),
    );
  }
}
