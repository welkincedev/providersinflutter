import 'package:flutter/material.dart';
import 'package:statemanagement/providerdemo/multiprovider/widgets/widgets.dart';

const products = [
  {"id ": "p1","name":"Flutter Tshirt","price":3000, },
  {"id ": "p2","name":"Jar","price":100, },
  {"id ": "p3","name":"Cup","price":50, },
  {"id ": "p4","name":"Demo","price":30, },
];



class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shop")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.6,
        ),
        itemCount: products.length,itemBuilder: (context,index){
          final product = products[index];
          return ProductCard(product: product);
      },
      ),
    );
  }
}
