import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Sử dụng provider package
import 'package:flutter_application_1/providers/favorite_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(
        context); // Sử dụng Provider để lấy dữ liệu
    final finalList = provider.favorites;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                Text(
                  'Favorite',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [

                        SlidableAction(
                          onPressed: (context) {
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),

                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        finalList[index].name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        finalList[index].description,
                        overflow: TextOverflow
                            .ellipsis, // khi văn bản quá giới hạn rộng sẽ ẩn...
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(finalList[index].image),
                        backgroundColor: Colors.red.shade100,
                      ),
                      trailing: Text(
                        ' ${finalList[index].price} VNĐ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      tileColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
