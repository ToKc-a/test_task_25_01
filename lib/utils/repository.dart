import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task_25_01/models/photo.dart';
import 'package:test_task_25_01/models/post.dart';
import 'package:test_task_25_01/models/user.dart';

const String server = 'https://jsonplaceholder.typicode.com';

class RepositoryPost {
  Future<PostList> fetchPosts() async {
    final url = Uri.parse('$server/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ошибка запроса');
    }
  }
}

class RepositoryUser {
  Future<User> fetchUser() async {
    final url = Uri.parse('$server/users/1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ошибка запроса');
    }
  }
}

class RepositoryPhoto {
  Future<PhotoList> fetchPhotos() async {
    final url = Uri.parse('$server/photos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return PhotoList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ошибка запроса');
    }
  }
}
