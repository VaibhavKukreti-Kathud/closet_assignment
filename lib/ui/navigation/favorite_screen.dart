import 'package:closet_assignment/models/cloth_item_model.dart';
import 'package:closet_assignment/widgets/main_app_bar.dart';
import 'package:closet_assignment/widgets/wardrobe_item_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<WardrobeItem> wardrobeItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 40,
          toolbarHeight: 86,
          centerTitle: false,
          title: 'Favorites',
          actionIcon: Iconsax.sort,
          onActionPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      RadioListTile(
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {},
                        title: Text('Sort by Date'),
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: 1,
                        onChanged: (value) {},
                        title: Text('Sort by Name'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: context
                      .read<FirebaseFirestore>()
                      .collection("items")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Map<String, dynamic>> wardrobeItems =
                          snapshot.data!.docs.map((e) => e.data()).toList();
                      List<WardrobeItem> favoriteList = wardrobeItems
                          .where((element) => element["isFavorite"] == true)
                          .map((e) => WardrobeItem.fromMap(e))
                          .toList();
                      return ListView.builder(
                          itemCount: favoriteList.length,
                          itemBuilder: (context, int index) {
                            return WardrobeItemTile(
                              wardrobeItem: favoriteList[index],
                              onFavoritePressed: () {
                                context
                                    .read<FirebaseFirestore>()
                                    .collection("items")
                                    .doc(favoriteList[index].id)
                                    .update(
                                  {
                                    "isFavorite":
                                        !favoriteList[index].isFavorite!,
                                  },
                                );
                              },
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
