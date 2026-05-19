import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/model/postModel9.dart';
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/services/apiServices9.dart';

final productServiceProvider = Provider<ApiService9>((ref){
  return ApiService9();
});

final postProvider9 = FutureProvider<List<ApiProducts9>>((ref){
  final apiservice = ref.read(productServiceProvider);
  return apiservice.fetchPosts();
});


