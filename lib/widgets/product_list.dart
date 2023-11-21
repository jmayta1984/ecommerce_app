import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.products});
  final List products;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: widget.products[index]);
        });
  }
}

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 150,
            child: Stack(children: [
              Image.network(widget.product.images[0]),
              Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  )),
            ])),
        Text(widget.product.name)
      ],
    );
  }
}
