import 'package:fek_api/model/Post_page.dart';
import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  final Post post;

  const TwoPage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("ID: ${post.id}"),
              const SizedBox(height: 20),
              Image.network(post.image),
              const SizedBox(height: 20),
              Text(
                "Rating: ${post.rating.toString()}",
                style: const TextStyle(fontSize: 18),
              ),
              Text(post.description),
              Text(post.rating.count.toString()),
              Text(post.rating.rate.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
