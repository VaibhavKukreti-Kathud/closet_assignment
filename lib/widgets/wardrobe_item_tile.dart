import 'package:closet_assignment/models/cloth_item_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class WardrobeItemTile extends StatelessWidget {
  const WardrobeItemTile({
    required this.onFavoritePressed,
    super.key,
    required this.wardrobeItem,
  });

  final WardrobeItem wardrobeItem;
  final Function() onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    bool isItemFavorited = wardrobeItem.isFavorite!;

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
              color: Theme.of(context).iconTheme.color!.withOpacity(0.1),
              blurRadius: 30,
              spreadRadius: -10,
              offset: Offset(0, 15),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                color:
                    Theme.of(context).colorScheme.surfaceTint.withOpacity(0.3),
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
                        '${wardrobeItem.brand == "" ? "Generic" : wardrobeItem.brand}\n\₹${wardrobeItem.price!.ceil()}\nby-@${wardrobeItem.uploadedBy}'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: Icon(
                        Iconsax.heart,
                        color: isItemFavorited ? Colors.red : Colors.black,
                      ),
                      onPressed: onFavoritePressed,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(wardrobeItem.category!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
