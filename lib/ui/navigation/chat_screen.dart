import 'dart:ui';

import 'package:closet_assignment/style_constants.dart';
import 'package:closet_assignment/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  ScrollController _chatController = ScrollController();
  ScrollController _groupController = ScrollController();

  bool showTabSwitcher = true;

  @override
  void initState() {
    _chatController.addListener(() {
      if (_chatController.position.activity!.isScrolling) {
        setState(() {
          showTabSwitcher = false;
        });
      }
      if (_chatController.position.atEdge) {
        bool isTop = _chatController.position.pixels == 0;
        if (isTop) {
          setState(() {
            showTabSwitcher = true;
          });
        } else {}
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
        length: 2, vsync: this, animationDuration: Duration(milliseconds: 400));
    return Scaffold(
      appBar: CustomAppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 40,
        toolbarHeight: 86,
        centerTitle: false,
        title: 'Chats',
        actionIcon: Iconsax.search_normal,
        onActionPressed: () {},
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          TabBarView(
            controller: tabController,
            children: [
              Scaffold(
                body: NotificationListener<ScrollEndNotification>(
                  // onNotification: (scrollEndNoti) {
                  //   if (scrollEndNoti.metrics.atEdge) {
                  //     setState(() {});
                  //     bool isTop = scrollEndNoti.metrics.pixels == 0;
                  //     if (isTop) {
                  //       setState(() {
                  //         showTabSwitcher = true;
                  //       });
                  //     } else if (scrollEndNoti.metrics.pixels != 0) {
                  //       setState(() {
                  //         showTabSwitcher = false;
                  //       });
                  //     }
                  //   }
                  //   return true;
                  // },
                  child: ListView.builder(
                    controller: _chatController,
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Hero(
                                        tag: index,
                                        child: Padding(
                                          padding: const EdgeInsets.all(64),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                "https://picsum.photos/300"),
                                            maxRadius: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2) -
                                                200,
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Hero(
                                tag: index,
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage("https://picsum.photos/300"),
                                  radius:
                                      MediaQuery.of(context).size.width / 16,
                                ),
                              ),
                            ),
                            title: Text('Vaibhav Kukreti'),
                            subtitle: Text('Hey!'),
                            trailing: Text('12:00pm'),
                          ),
                          Container(
                            height: 1,
                            margin: EdgeInsets.symmetric(horizontal: 80),
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.1),
                            ),
                          ),
                          SizedBox(height: index == 10 ? 120 : 2),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Scaffold(
                body: ListView.builder(
                  itemCount: 8,
                  controller: _groupController,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage("https://picsum.photos/300"),
                            radius: MediaQuery.of(context).size.width / 16,
                          ),
                          title: Text('Birthday party 🎊'),
                          subtitle: Text('Vaibhav: Hey!'),
                          trailing: Text('12:00pm'),
                        ),
                        Container(
                          height: 1,
                          margin: EdgeInsets.symmetric(horizontal: 80),
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).dividerColor.withOpacity(0.1),
                          ),
                        ),
                        SizedBox(height: 2),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            bottom: showTabSwitcher ? 16 : -65,
            right: 100,
            left: 100,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: showTabSwitcher
                        ? Theme.of(context).iconTheme.color!.withOpacity(0.2)
                        : Colors.transparent,
                    blurRadius: 30,
                    spreadRadius: -10,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.8),
                    blurRadius: 0,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
              duration: const Duration(milliseconds: 300),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0),
                    ),
                    child: TabBar(
                      labelStyle:
                          getSubtitleTextStyle(context).copyWith(fontSize: 12),
                      unselectedLabelColor:
                          Theme.of(context).iconTheme.color!.withOpacity(0.3),
                      splashBorderRadius: BorderRadius.circular(30),
                      dividerColor:
                          Theme.of(context).dividerColor.withOpacity(0),
                      controller: tabController,
                      tabs: [
                        Tab(
                          icon: Icon(Iconsax.message),
                          text: "Chats",
                        ),
                        Tab(
                          icon: Icon(Iconsax.messages),
                          text: "Groups",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
