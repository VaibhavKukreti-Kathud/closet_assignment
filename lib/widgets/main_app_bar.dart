import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color? surfaceTintColor;
  final double? elevation;
  final double? toolbarHeight;
  final bool? centerTitle;
  final String title;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;
  final Widget? leading;
  bool Function(ScrollNotification)? notificationPredicate;

  CustomAppBar({
    Key? key,
    this.surfaceTintColor,
    this.elevation,
    this.toolbarHeight,
    this.centerTitle,
    required this.title,
    this.notificationPredicate,
    this.leading,
    this.actionIcon,
    this.onActionPressed,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, 86);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool showDivider = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: widget.leading,
        automaticallyImplyLeading: widget.leading == null,
        surfaceTintColor: widget.surfaceTintColor,
        elevation: widget.elevation,
        toolbarHeight: widget.toolbarHeight,
        centerTitle: widget.centerTitle,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 1,
            color: showDivider
                ? Theme.of(context).dividerColor.withOpacity(0.1)
                : Colors.transparent,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 8, top: 20, bottom: 8),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        notificationPredicate: widget.notificationPredicate ??
            (ScrollNotification s) {
              if (!s.metrics.atEdge && s.metrics.pixels > 0) {
                setState(() {
                  showDivider = true;
                });
                return true;
              } else if (s.metrics.atEdge && (s.metrics.pixels == 0)) {
                setState(() {
                  showDivider = false;
                });
                return true;
              } else {
                return false;
              }
            },
        actions: widget.actionIcon == null
            ? []
            : [
                Padding(
                    padding:
                        const EdgeInsets.only(right: 8, top: 12, bottom: 0),
                    child: IconButton(
                      icon: Icon(
                        widget.actionIcon,
                        size: 27,
                      ),
                      onPressed: widget.onActionPressed,
                    )),
              ]);
  }
}
