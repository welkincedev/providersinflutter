import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/model/postModel12.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/services/apiServices12.dart';

final productServiceProvider = Provider<ApiService12>((ref){
  return ApiService12();
});

final postProvider12 = FutureProvider<List<ApiProducts12>>((ref){
  final apiservice = ref.read(productServiceProvider);
  return apiservice.fetchPosts();
});


