import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:request_manager/utils/constant/app_colors.dart';
import 'package:request_manager/utils/constant/app_size.dart';
import 'package:request_manager/widgets/loaders/default_loader.dart';

class DocumentCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int number_download;
  final double height;
  final double width;

  const DocumentCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.number_download,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: height * 1.2,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                placeholder: (context, url) => DefaultLoader(
                  height: height * 1.2,
                  width: width,
                  borderRaduis: 10,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(height: AppSizes.smallMargin(context)),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: AppSizes.smallTextSize(context) * 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.smallPadding(context) * 0.5,
                horizontal: AppSizes.smallPadding(context) * 0.8,
              ),
              margin: EdgeInsets.all(AppSizes.smallPadding(context) * 0.8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.secondary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.download_rounded,
                    color: Colors.white,
                    size: AppSizes.iconSize(context) * 0.8,
                  ),
                  Text(
                    number_download.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
