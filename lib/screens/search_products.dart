import 'package:ecommerce_app/services/product_service.dart';
import 'package:ecommerce_app/widgets/product_list.dart';
import 'package:flutter/material.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({super.key});

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  List products = [];

    final searchController = TextEditingController();

  initialize() async {
    products = await ProductService().getAll();
    setState(() {
      products = products;
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void searchProducts(String value) async {
    products = await ProductService().getByName(value);
    setState(() {
      products = products;
      
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.white54),
          onSubmitted: searchProducts,
        ),
      ),
      body: ProductList(products: products),
    );
  }
}
