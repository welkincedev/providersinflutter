import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_eight_Riverpod/Model/postModel.dart';
import 'package:statemanagement/providerdemo/provider_eight_Riverpod/services/api_service.dart';

final apiServiceProvider = Provider<ApiService8>((ref){
  return ApiService8();
});

final postProvider = FutureProvider<List<PostModel>>((ref){
  final apiservice = ref.read(apiServiceProvider);
  return apiservice.fetchPosts();
});