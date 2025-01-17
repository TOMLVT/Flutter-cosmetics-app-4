import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/favorite_provider.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          // icon favorite right 
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             GestureDetector(
              onTap: () => provider.toggleFavorite(widget.product),
              child:  Icon(
                provider.isExist(widget.product) ? Icons.favorite : Icons.favorite_border_outlined,
               
                color: Colors.red,
              ),
             )
            ],
          ),

          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.product.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            widget.product.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            widget.product.category,
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            ' ${widget.product.price} VNĐ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
