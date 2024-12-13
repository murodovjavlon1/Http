import 'dart:convert';

import 'package:fek_api/model/Post_page.dart';
import 'package:http/http.dart';

class Network {
  static String BASE = "fakestoreapi.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/jon; charset=UTF-8'
  };

  static String API_GET = "/products";
  static String API_POST = "/products";
  static String API_PUT = "/products"; //{id}
  static String API_DEL = "/products"; //{id}

  static Future<String?> GET(String api, Map<String, String> paeams) async {
    var url = Uri.https(BASE, api, paeams);
    var response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> paeams) async {
    var url = Uri.https(BASE, api);
    var response = await post(url, headers: headers, body: jsonEncode(paeams));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> paeams) async {
    var url = Uri.https(BASE, api);
    var response = await put(url, headers: headers, body: jsonEncode(paeams));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> paeams) async {
    var url = Uri.https(BASE, api, paeams);
    var response = await delete(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> delete_params() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, dynamic> post_params(Post post) => {
        "title": post.title,
        "id": post.id,
        "price": post.price,
        "description": post.description,
        "category": post.category,
        "image": post.image,
        "rating": post.rating,
        "rate": post.rating.rate,
        "count": post.rating.count,
      };

  static Map<String, dynamic> put_params(Post post) => {
        "title": post.title,
        "id": post.id,
        "price": post.price,
        "description": post.description,
        "category": post.category,
        "image": post.image,
        "rating": post.rating,
        "rate": post.rating.rate,
        "count": post.rating.count,
      };

  static List<Post> parsingResponse(String response) {
    var myJson = jsonDecode(response);
    //map edi listga modeldagi from jsonni ishlatdim
    List<Post> data = List.from(myJson.map((x) => Post.fromJson(x)));
    return data;

    //   static List<Post> parerPostList(String response) {
    //   dynamic json = jsonDecode(response);
    //   var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    //   return data;
    // }
  }
}
