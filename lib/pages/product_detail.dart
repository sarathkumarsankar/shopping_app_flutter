import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/products.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late List<int> sizes;
  int selectedSize = 0;

  @override
  void initState() {
    super.initState();
    sizes = widget.product.sizes;
  }

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addToCart(CartItem(
          id: widget.product.id,
          title: widget.product.title,
          price: widget.product.price,
          imageUrl: widget.product.imageUrl,
          company: widget.product.company,
          size: selectedSize,
          category: widget.product.category));
        
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Added to cart successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please select size')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final price = widget.product.price.toString();

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Details',
        style: Theme.of(context).textTheme.bodySmall,
      )),
      body: Column(children: [
        Center(
          child: Text(widget.product.title.toString(),
              style: Theme.of(context).textTheme.titleLarge),
        ),
        const Spacer(),
        Image.asset(
          widget.product.imageUrl.toString(),
          height: 250,
        ),
        const Spacer(
          flex: 2,
        ),
        Container(
          height: 250,
          color: const Color.fromRGBO(245, 247, 249, 1),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text("£$price", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: sizes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterChip(
                            backgroundColor: sizes[index] == selectedSize
                                ? Theme.of(context).primaryColor
                                : const Color.fromRGBO(243, 245, 248, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Color.fromRGBO(156, 154, 157, 1)),
                            ),
                            label: Text(sizes[index].toString()),
                            onSelected: (value) {
                              setState(() {
                                selectedSize = sizes[index];
                              });
                            },
                          ));
                    })),
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(icon: const Icon(Icons.shopping_cart_checkout_outlined,), label: const Text(
                    'Add To Cart',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black),
                  ), onPressed: () {
                      onTap();
                  }, style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      fixedSize: const Size(300, 40)),)

            ],
          ),
        )
      ]),
    );
  }
}
