import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/model/postModel12.dart';

class DetailsScreen12 extends ConsumerWidget {
  final ApiProducts12 products;

  const DetailsScreen12({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Product Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            height: 300,
            child: Image.network(
              products.image,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              products.title,
              style: const TextStyle(overflow: TextOverflow.ellipsis,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "\$${products.price}",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.orange[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.star, color: Colors.yellow.shade600),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(products.description),
          ),
        ],
      ),
    );
  }
}