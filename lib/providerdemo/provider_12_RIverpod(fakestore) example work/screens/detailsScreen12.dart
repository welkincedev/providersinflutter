import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/model/postModel12.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen12 extends ConsumerWidget {
  final ApiProducts12 products;

  const DetailsScreen12({super.key, required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey.shade300,
              width: double.infinity,
              height: 300,
              child: Image.network(products.image, fit: BoxFit.contain),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      products.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "\$${products.price}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.orange[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Row(
                          children: [
                            RatingBarIndicator(
                              rating: products.rating.rate,
                              itemBuilder: (context, index) =>
                                  const Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 18,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 4),
                            Text("(${products.rating.rate})"),
                            SizedBox(width: 4),
                            Text("(${products.rating.count} Reviews)"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Descrption",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(products.description),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              "Added ${products.title.split(" ").first} added to cart",
                            ),
                          ),
                        );
                      },
                      child: Text("Add to Cart"),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Buy Now"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
