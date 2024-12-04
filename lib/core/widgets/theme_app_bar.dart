import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ThemeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingIcon;
  final String? title;
  final Widget? otherIcon;
  final PreferredSizeWidget? bottomWidget;

  const ThemeAppBar({
    super.key,
    this.leadingIcon,
    this.title,
    this.otherIcon,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      centerTitle: true,
      backgroundColor: AppColors.primary,
      elevation: 4,
      leading: leadingIcon ??
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.white,
                  size: 18,
                ),
              ),
            ),
          ),
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: AppColors.white),
            )
          : null,
      actions: otherIcon != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: otherIcon,
              ),
            ]
          : null,
      bottom: bottomWidget,
    );

    // return SliverAppBar(
    //   floating: true,
    //   elevation: 0,
    //   centerTitle: false,
    //   automaticallyImplyLeading: false,
    //   backgroundColor: Theme.of(context).primaryColor,
    //   title: title != null
    //       ? Text(
    //           title!,
    //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
    //               fontWeight: FontWeight.w800,
    //               fontSize: 15,
    //               color: AppColors.white),
    //         )
    //       : null,
    //   actions: otherIcon != null
    //       ? [
    //           Padding(
    //             padding: const EdgeInsets.only(right: 2.0),
    //             child: otherIcon,
    //           ),
    //         ]
    //       : null,
    // );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottomWidget == null ? 60 : 100);
}
