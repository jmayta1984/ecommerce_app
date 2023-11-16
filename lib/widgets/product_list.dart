import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List? products;

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: (products == null) ? 0 : products!.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(products![index].name));
        });
  }
}
