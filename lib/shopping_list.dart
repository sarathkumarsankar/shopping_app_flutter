import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_detail.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShoppingListPage> {
    final TextEditingController controller = TextEditingController();
  final List<String> filters = [
    "All",
    "Adidas",
    "Nike",
    "Bata",
    "Reebok",
    "JD"
  ];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {

    const inputDecoration = InputDecoration(
      prefixIcon: Icon(Icons.search),
      hintText: "Search",
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), bottomLeft: Radius.circular(40.0)),
      ));

    return Scaffold(
        body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                 SizedBox(
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Shoes Collection",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: inputDecoration,
                ))
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < filters.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilterChip(
                          padding: const EdgeInsets.all(14),
                          label: Text(filters[i]),
                          backgroundColor: filters[i] == selectedFilter
                              ? Theme.of(context).primaryColor
                              : const Color.fromRGBO(243, 245, 248, 1),
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.white),
                          ),
                          onSelected: (value) {
                            setState(() {
                              selectedFilter = filters[i];
                            });
                          },
                        ),
                      )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    // return ProductCard();
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailPage(
                                  product: products[index]);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: products[index]["title"] as String,
                        price: products[index]["price"].toString(),
                        imageUrl: products[index]["imageUrl"] as String,
                        backGroundcolor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  })),
            )
          ],
        ),
      ), 
    );
  }
}