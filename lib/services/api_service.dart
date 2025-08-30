import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/post.dart';
import '../utils/constants.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final http.Client _client = http.Client();

  // Fetch all users
  Future<List<User>> getUsers() async {
    try {
      print('Fetching users from: ${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}');
      
      final response = await _client
          .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}'))
          .timeout(const Duration(seconds: 15));

      print('Response status: ${response.statusCode}');
      print('Response body length: ${response.body.length}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        print('Parsed ${jsonData.length} users');
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        print('Error response: ${response.body}');
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception in getUsers: $e');
      throw Exception('Network error: $e');
    }
  }

  // Fetch a single user by ID
  Future<User> getUserById(int userId) async {
    try {
      final response = await _client
          .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/$userId'))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return User.fromJson(jsonData);
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Fetch all posts
  Future<List<Post>> getPosts() async {
    try {
      print('Fetching posts from: ${ApiConstants.baseUrl}${ApiConstants.postsEndpoint}');
      
      final response = await _client
          .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.postsEndpoint}'))
          .timeout(const Duration(seconds: 15));

      print('Response status: ${response.statusCode}');
      print('Response body length: ${response.body.length}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        print('Parsed ${jsonData.length} posts');
        return jsonData.map((json) => Post.fromJson(json)).toList();
      } else {
        print('Error response: ${response.body}');
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception in getPosts: $e');
      throw Exception('Network error: $e');
    }
  }

  // Fetch posts by user ID
  Future<List<Post>> getPostsByUserId(int userId) async {
    try {
      final response = await _client
          .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.postsEndpoint}?userId=$userId'))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}
