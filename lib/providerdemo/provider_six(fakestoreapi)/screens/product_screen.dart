import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providerdemo/api_provider_five/widgets/error_view.dart';
import 'package:statemanagement/providerdemo/multiprovider/model/datas.dart';
import 'package:statemanagement/providerdemo/provider_six(fakestoreapi)/controller/product_provider.dart';
import 'package:statemanagement/providerdemo/provider_six(fakestoreapi)/widget/ProductsCard.dart';

class ProductScreen extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductProvider>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.read<ProductProvider>().fetchProducts());
    return Scaffold(
      appBar: AppBar(title: Text("Products from API")),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && products.isEmpty) {
            return CircularProgressIndicator();
          }
          if (provider.errorMsg.isNotEmpty && products.isEmpty) {
            return ErrorView(
              message: provider.errorMsg,
              onRetry: provider.fetchProducts,
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) => ProductsCard(),
              itemCount: products.length,
            ),
          );
        },
      ),
    );
  }
}


