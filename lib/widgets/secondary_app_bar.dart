import 'package:closet_assignment/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class SecondaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SecondaryAppBar({
    Key? key,
    this.screenName = 'Pinehouse',
    this.hasBackButton = true,
    this.onBackPressed,
    this.systemNavigationBarColor,
    this.actions = const [],
    this.bottom,
    this.customTitle,
    this.onTitlePressed,
  }) : super(key: key);
  final String screenName;
  final Widget? customTitle;
  final Function()? onTitlePressed;
  final Color? systemNavigationBarColor;
  final bool hasBackButton;
  final List<Widget> actions;
  final Widget? bottom;
  final Function()? onBackPressed;

  @override
  State<SecondaryAppBar> createState() => _SecondaryAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _SecondaryAppBarState extends State<SecondaryAppBar> {
  bool showDivider = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: widget.systemNavigationBarColor ??
            Theme.of(context).scaffoldBackgroundColor,
      ),
      elevation: 0,
      notificationPredicate: (notification) {
        if (notification is ScrollUpdateNotification) {
          if (notification.metrics.axis == Axis.vertical) {
            if (notification.metrics.pixels > 0) {
              setState(() {
                showDivider = true;
              });
            } else {
              setState(() {
                showDivider = false;
              });
            }
          }
        }
        return true;
      },
      toolbarHeight: 64,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: widget.hasBackButton
          ? IconButton(
              onPressed: widget.onBackPressed ?? () => Navigator.pop(context),
              icon: const Icon(Iconsax.arrow_left_24),
            )
          : const SizedBox(),
      actions: widget.actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: widget.bottom ??
            (showDivider
                ? Divider(height: 1, color: kSeperatorColor)
                : const SizedBox(height: 1)),
      ),
      surfaceTintColor: Theme.of(context).primaryColor,
      title: GestureDetector(
        onTap: widget.onTitlePressed,
        child: widget.customTitle ??
            Text(widget.screenName,
                style: getTitleTextStyle(context)
                    .copyWith(color: Theme.of(context).iconTheme.color)),
      ),
    );
  }
}
