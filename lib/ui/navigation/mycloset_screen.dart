import 'dart:math';
import 'dart:ui';

import 'package:closet_assignment/models/cloth_item_model.dart';
import 'package:closet_assignment/models/wardrobe_category_model.dart';
import 'package:closet_assignment/style_constants.dart';
import 'package:closet_assignment/widgets/main_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyClosetScreen extends StatefulWidget {
  const MyClosetScreen({super.key});

  static List<WardrobeCategory> categories = [
    WardrobeCategory(
        name: "Tops",
        image:
            "https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    WardrobeCategory(
        name: "Bottoms",
        image:
            "https://images.unsplash.com/photo-1634564235572-cd6f37694266?q=80&w=400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    WardrobeCategory(
        name: "Footwear",
        image:
            "https://images.unsplash.com/flagged/photo-1556637640-2c80d3201be8?q=80&w=300&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    WardrobeCategory(
        name: "Accessories",
        image:
            "https://images.unsplash.com/photo-1585856331426-d7a22437d4bb?q=80&w=300&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    WardrobeCategory(
        name: "Outerwear",
        image:
            "https://images.unsplash.com/photo-1533230464445-e01ef07c65c5?q=80&w=300&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    WardrobeCategory(
        name: "Jumpsuits",
        image:
            "https://images.unsplash.com/photo-1600689482725-bc3f308be252?q=80&w=300&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    WardrobeCategory(
        name: "Others",
        image:
            "https://images.unsplash.com/photo-1627511306341-f9d96646b91d?q=80&w=300&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  ];

  @override
  State<MyClosetScreen> createState() => _MyClosetScreenState();
}

class _MyClosetScreenState extends State<MyClosetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 40,
        toolbarHeight: 86,
        centerTitle: false,
        title: 'My Closet',
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.width / 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage("https://picsum.photos/300"),
                          radius: MediaQuery.of(context).size.width / 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          padding: EdgeInsets.all(6),
                          child: Icon(Iconsax.edit_2,
                              size: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vaibhav Kukreti',
                        style: getTitleTextStyle(context),
                      ),
                      Text(
                        '@vklightning',
                        style: getSubtitleTextStyle(context),
                      ),
                      SizedBox(height: 16),
                      ZoomTapAnimation(
                        onTap: () {
                          showAddItemDialog(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.surfaceTint,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 64, vertical: 10),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.5),
                                  child: Icon(
                                    Iconsax.add,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  "Add to Closet",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          GridView.extent(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            childAspectRatio: 2.4 / 1,
            physics: NeverScrollableScrollPhysics(),
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: MyClosetScreen.categories.map((category) {
              return ZoomTapAnimation(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 30,
                        spreadRadius: -10,
                        offset: Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(category.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 95, 95, 95).withOpacity(0.8),
                            const Color.fromARGB(255, 95, 95, 95)
                                .withOpacity(0.07)
                          ],
                          stops: [
                            0,
                            0.5
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: double.maxFinite),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.grey[700]!.withOpacity(0.3)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Text(
                                    category.name,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text("${Random().nextInt(12)} Items",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white.withOpacity(0.8))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Future<Object?> showAddItemDialog(BuildContext context) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder: (context, animation, secondaryAnimation) {
          String? category;
          final TextEditingController nameController = TextEditingController();
          final TextEditingController brandController = TextEditingController();
          final TextEditingController _colorsController =
              TextEditingController();
          final TextEditingController _userController = TextEditingController();
          final TextEditingController _priceController =
              TextEditingController();
          String _imagePath = "";
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 64, bottom: 64 * 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                    child: Material(
                      color: Colors.white.withOpacity(0.7),
                      // resizeToAvoidBottomInset: false,
                      // appBar: PreferredSize(
                      //   preferredSize: Size.fromHeight(57),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       AppBar(
                      //           backgroundColor: Colors.white.withOpacity(0.8),
                      //           automaticallyImplyLeading: false,
                      //           centerTitle: false,
                      //           title: Text(
                      //             "Item details",
                      //             style: getTitleTextStyle(context),
                      //           ),
                      //           actions: [
                      //             IconButton(
                      //                 icon: Icon(
                      //                   Icons.close,
                      //                   size: 18,
                      //                 ),
                      //                 onPressed: () {
                      //                   Navigator.pop(context);
                      //                 }),
                      //           ]),
                      //       // Container(
                      //       //     height: 1,
                      //       //     decoration: BoxDecoration(
                      //       //       color: Theme.of(context)
                      //       //           .dividerColor
                      //       //           .withOpacity(0.1),
                      //       //     ))
                      //     ],
                      //   ),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24),
                            Text(
                              "Add Item",
                              style: getTitleTextStyle(context)
                                  .copyWith(fontSize: 24),
                            ),
                            SizedBox(height: 24),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Name',
                              ),
                            ),
                            SizedBox(height: 16),
                            TextField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Price(Rs.)',
                              ),
                            ),
                            SizedBox(height: 16),

                            // Brand field
                            TextField(
                              controller: brandController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Brand(optional)',
                              ),
                            ),

                            SizedBox(height: 16),

                            // User field
                            TextField(
                              controller: _userController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Username(optional)',
                              ),
                            ),
                            SizedBox(height: 16),

                            // Category field
                            DropdownMenu(
                              initialSelection: "Category",
                              hintText: "Category",
                              inputDecorationTheme: InputDecorationTheme(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              width: MediaQuery.of(context).size.width - 64,
                              dropdownMenuEntries:
                                  MyClosetScreen.categories.map((category) {
                                return DropdownMenuEntry(
                                  label: category.name,
                                  value: category.name,
                                );
                              }).toList(),
                              onSelected: (value) {
                                setState(
                                  () {
                                    category = value;
                                  },
                                );
                              },
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) =>
                                                Colors.white.withOpacity(0.5)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                                onPressed: () {
                                  // Process form data
                                  String name = nameController.text;
                                  String brand = brandController.text;
                                  String colors = _colorsController.text;
                                  String user = _userController.text;
                                  String imagePath = _imagePath;
                                  String price = _priceController.text;
                                  WardrobeItem enteredItem = WardrobeItem(
                                      id: context
                                          .read<FirebaseFirestore>()
                                          .collection("items")
                                          .id,
                                      name: name,
                                      color: [],
                                      price: double.parse(price),
                                      brand: brand,
                                      uploadedBy: "vaibhav");

                                  try {
                                    context
                                        .read<FirebaseFirestore>()
                                        .collection("items")
                                        .add(enteredItem.toMap());
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: Text('Submit'),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
