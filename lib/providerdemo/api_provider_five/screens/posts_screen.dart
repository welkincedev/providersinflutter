import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providerdemo/api_provider_five/providers/post_providers.dart';
import 'package:statemanagement/providerdemo/api_provider_five/widgets/error_view.dart';
import 'package:statemanagement/providerdemo/api_provider_five/widgets/post_card.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  Future<void> _refreshPosts(BuildContext context) async {
    await context.read<PostProvider>().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch API when screen loads

    Future.microtask(() {
      context.read<PostProvider>().fetchPosts();
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'), centerTitle: true),
      body: Consumer<PostProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.errorMessage.isNotEmpty && provider.posts.isEmpty) {
            return ErrorView(message: provider.errorMessage,
            onRetry : provider.fetchPosts);
          }
          return RefreshIndicator(
            onRefresh: () => _refreshPosts(context),

            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: provider.posts.length,
              itemBuilder: (context, index) {
                final post = provider.posts[index];

                return PostCard(
                  post: post,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  post.body,
                                  style: const TextStyle(
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
