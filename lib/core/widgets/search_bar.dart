import 'package:flutter/material.dart';

import '../localization/app_localizations/app_localization.dart';
import '../theme/colors.dart';
import '../utils/dimensions.dart';
import 'cus_text_field.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeSmall,
            vertical: Dimensions.paddingSizeSmall),
        color: AppColors.background,
        alignment: Alignment.center,
        child: Expanded(
          child: CusTextField(
            fillColor: AppColors.white,
            hintText: getTranslated('SEARCH_PRODUCT', context),
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
            isBorder: false,
            borderColor: Colors.transparent,
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: 1),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(9),
                        topRight: Radius.circular(9))),
                child: const Icon(Icons.search,
                    color: AppColors.white, size: Dimensions.iconSizeLarge),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
