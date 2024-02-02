import 'package:closet_assignment/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Center(
          child: CircleAvatar(
            maxRadius: 24,
            backgroundColor: kSeperatorColor,
            child: Icon(
              Iconsax.user,
              color: kSubTitleStyle.color,
              size: 27,
            ),
          ),
        ),
        Container(
          height: 12,
          width: 12,
          margin: const EdgeInsets.only(bottom: 17, right: 0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kSecondaryColor,
          ),
        )
      ],
    );
  }
}
