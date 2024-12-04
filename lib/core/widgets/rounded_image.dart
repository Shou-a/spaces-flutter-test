import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/colors.dart';

class RoundedImage extends StatelessWidget {
  final String? assetPath;
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const RoundedImage({
    super.key,
    this.assetPath,
    this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
  }) : assert(
          (assetPath != null && imageUrl == null) ||
              (assetPath == null && imageUrl != null),
          'Either assetPath or imageUrl must be provided, but not both.',
        );

  @override
  Widget build(BuildContext context) {
    return assetPath != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(width / 2),
            child: Image.asset(
              assetPath!,
              width: width,
              height: height,
              fit: fit,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(width / 2),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              width: width,
              height: height,
              fit: fit,
              placeholder: (context, url) => Container(
                width: width,
                height: height,
                color: Colors.grey.shade200,
                child: const Center(
                  child: SpinKitFadingCircle(
                    color: AppColors.primary50,
                    size: 50.0,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Image.asset(
                "assets/app/profile.png",
                width: width,
                height: height,
                fit: fit,
              ),
            ),
          );
  }
}
