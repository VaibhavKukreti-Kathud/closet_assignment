import 'package:closet_assignment/models/cloth_item_model.dart';
import 'package:closet_assignment/ui/search/search_screen.dart';
import 'package:closet_assignment/widgets/main_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 40,
        toolbarHeight: 86,
        leading: IconButton(
          padding: EdgeInsets.only(left: 16, top: 15),
          icon: Icon(Iconsax.menu_14),
          splashColor: Colors.transparent,
          onPressed: () {
            widget.scaffoldKey!.currentState!.openDrawer();
          },
        ),
        centerTitle: false,
        title: 'Discover',
        actionIcon: Iconsax.search_normal,
        onActionPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SearchScreen();
              },
            ),
          );
        },
      ),
      body: StreamBuilder(
        stream:
            context.read<FirebaseFirestore>().collection("items").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Map<String, dynamic>> wardrobeItems =
                snapshot.data!.docs.map((e) => e.data()).toList();
            return ListView.builder(
                itemCount: wardrobeItems.length,
                itemBuilder: (context, int index) {
                  WardrobeItem wardrobeItem =
                      WardrobeItem.fromMap(wardrobeItems[index]);
                  return ZoomTapAnimation(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          // BoxShadow(
                          //   color: Theme.of(context).iconTheme.color!.withOpacity(0.00),
                          //   blurRadius: 20,
                          //   offset: Offset(0, 15),
                          // ),
                          BoxShadow(
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(0.1),
                            blurRadius: 30,
                            spreadRadius: -10,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 8,
                        top: index == 0 ? 16 : 8,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(wardrobeItem.imageUrl),
                                  fit: BoxFit.cover),
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceTint
                                  .withOpacity(0.3),
                            ),
                          ),
                          SizedBox(width: 4),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text('Title'),
                          //     Row(
                          //       children: [
                          //         CircleAvatar(
                          //             backgroundColor: Colors.amber[100], radius: 12),
                          //         SizedBox(width: 4),
                          //         CircleAvatar(
                          //             backgroundColor: Colors.pink[100], radius: 12),
                          //         SizedBox(width: 4),
                          //         CircleAvatar(
                          //             backgroundColor: Colors.green[100], radius: 12),
                          //       ],
                          //     ),
                          //     Text('Price'),
                          //   ],
                          // ),
                          SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width - 186,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4),
                                ListTile(
                                  title: Text(wardrobeItem.name),
                                  subtitle: Text(
                                      '${wardrobeItem.brand == "" ? "Generic" : wardrobeItem.brand}\n₹${wardrobeItem.price!.ceil()}\nby-@${wardrobeItem.uploadedBy}'),
                                  isThreeLine: true,
                                  trailing: IconButton(
                                    icon: Icon(
                                      Iconsax.heart,
                                      color: wardrobeItem.isFavorite!
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<FirebaseFirestore>()
                                          .collection("items")
                                          .doc(wardrobeItem.id)
                                          .update({
                                        "isFavorite": !wardrobeItem.isFavorite!
                                      }).then((value) => setState(() {}));
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .dividerColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Text(
                                    wardrobeItem.category!,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}
