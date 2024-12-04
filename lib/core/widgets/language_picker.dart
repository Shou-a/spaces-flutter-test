import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../localization/app_localizations/app_localization.dart';
import '../localization/app_localizations/provider/localization_provider.dart';
import '../theme/colors.dart';
import '../utils/app_consts.dart';
import '../utils/dimensions.dart';
import '../utils/lang_const.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int? index;
    index =
        Provider.of<LocalizationProvider>(context, listen: false).languageIndex;
    List<String?> valueList = [];

    for (var language in AppConst.languages) {
      valueList.add(language.languageName);
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Text(getTranslated('language', context)!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: Dimensions.fontSizeLarge)),
            ),
            SizedBox(
              height: 150,
              child: CupertinoPicker(
                itemExtent: 40,
                useMagnifier: true,
                magnification: 1.2,
                scrollController:
                    FixedExtentScrollController(initialItem: index!),
                onSelectedItemChanged: (int i) {
                  index = i;
                },
                children: valueList.map((value) {
                  return Center(
                      child: Text(value!,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color)));
                }).toList(),
              ),
            ),
            const Divider(
                height: Dimensions.paddingSizeExtraSmall,
                color: AppColors.subText),
            Row(children: [
              Expanded(
                  child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(getTranslated(LangConst.cancel, context)!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.secondary)),
              )),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeExtraSmall),
                child: VerticalDivider(
                    width: Dimensions.paddingSizeExtraSmall,
                    color: Theme.of(context).hintColor),
              ),
              Expanded(
                  child: TextButton(
                onPressed: () {
                  Provider.of<LocalizationProvider>(context, listen: false)
                      .setLanguage(Locale(
                    AppConst.languages[index!].languageCode!,
                    AppConst.languages[index!].countryCode,
                  ));

                  //////////////////////////////////////////////////////////////////////////////////////////
                  ///////////////  Need to Update Overall App Data with new Selected Language///////////////
                  //////////////////////////////////////////////////////////////////////////////////////////

                  // Provider.of<CategoryProvider>(context, listen: false)
                  //     .getCategoryList(true);
                  // Provider.of<HomeCategoryProductProvider>(context,
                  //         listen: false)
                  //     .getHomeCategoryProductList(true);
                  // Provider.of<TopSellerProvider>(context, listen: false)
                  //     .getTopSellerList(true);
                  // Provider.of<BrandProvider>(context, listen: false)
                  //     .getBrandList(true);
                  // Provider.of<ProductProvider>(context, listen: false)
                  //     .getLatestProductList(1, reload: true);
                  // Provider.of<ProductProvider>(context, listen: false)
                  //     .getFeaturedProductList('1', reload: true);
                  // Provider.of<FeaturedDealProvider>(context, listen: false)
                  //     .getFeaturedDealList(true);
                  // Provider.of<ProductProvider>(context, listen: false)
                  //     .getLProductList('1', reload: true);
                  // Provider.of<BlogProvider>(context, listen: false)
                  //     .getBlogsList(true, false);
                  // Provider.of<HomeServiceProvider>(context, listen: false)
                  //     .fetchBanner();
                  // Provider.of<HomeServiceProvider>(context, listen: false)
                  //     .fetchButtonConfig();

                  Navigator.pop(context);
                },
                child: Text(getTranslated(LangConst.ok, context)!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.success)),
              )),
            ]),
          ]),
    );
  }
}
