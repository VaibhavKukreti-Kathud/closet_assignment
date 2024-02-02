import 'package:closet_assignment/models/cloth_item_model.dart';
import 'package:closet_assignment/widgets/wardrobe_item_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Iconsax.arrow_left_2),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Search'),
        ),
        body: Column(
          children: [
            //Search bar
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for items',
                  prefixIcon: Icon(Iconsax.search_normal),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  //Search for items
                  FirebaseFirestore.instance.collection('items').get();
                  setState(() {
                    results = results
                        .where((element) => element.name.contains(value))
                        .toList();
                  });
                },
                onSubmitted: (value) {
                  //Search for items
                  FirebaseFirestore.instance.collection('items').get();
                  setState(() {
                    results = results
                        .where((element) => element.name.contains(value))
                        .toList();
                  });
                },
              ),
            ),
            //Search results
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  WardrobeItem wardrobeItem =
                      WardrobeItem.fromMap(results[index].data());
                  return WardrobeItemTile(
                      onFavoritePressed: () {}, wardrobeItem: wardrobeItem);
                },
              ),
            ),
          ],
        ));
  }
}
