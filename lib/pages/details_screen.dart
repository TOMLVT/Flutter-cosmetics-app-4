import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/cart_details.dart';
import 'package:flutter_application_1/providers/cart_provider.dart';
import 'package:flutter_application_1/widgets/available_size.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Chỉ định kiểu cụ thể của provider
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 36.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                ),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 36.0,
          ),
          Container(
            height: 400,
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${product.price}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Available Size",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: const [
                    AvailableSize(size: "US 6"),
                    AvailableSize(size: "US 7"),
                    AvailableSize(size: "US 8"),
                    AvailableSize(size: "US 9"),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.amber,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${product.price}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  cartProvider.toggleProduct(product);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartDetails()),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text("Add to Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
