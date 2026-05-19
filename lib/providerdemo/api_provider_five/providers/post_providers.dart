import 'package:flutter/material.dart';
import 'package:statemanagement/providerdemo/api_provider_five/model/post.dart';
import 'package:statemanagement/providerdemo/api_provider_five/services/post_service.dart';

class PostProvider extends ChangeNotifier {
  final PostService _service = PostService();

  List<Post> _posts = [];
  String _errorMessage = '';
  bool _isLoading = true;

  // ── Getters ─────────────────────────────────────

  bool get hasData => _posts.isNotEmpty;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  List<Post> get posts => _posts;

  // ── Fetch Posts ─────────────────────────────────

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _posts = await _service.fetchPosts();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
