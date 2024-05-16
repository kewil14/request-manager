import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:request_manager/utils/constant/app_colors.dart';
import 'package:request_manager/utils/constant/app_size.dart';
import 'package:request_manager/utils/enums/user_request_state.dart';

class ArticleItem extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final UserRequestStatus status;
  final DateTime publishedDate;
  final bool isRead;
  final int shareCount;

  const ArticleItem({
    Key? key,
    required this.title,
    required this.author,
    required this.description,
    required this.status,
    required this.publishedDate,
    required this.isRead,
    required this.shareCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('d MMM yyyy', "fr_FR").format(publishedDate);
    return Container(
      // elevation: 2, // Ombre discret
      padding: EdgeInsets.all(
        AppSizes.mediumMargin(context),
      ),
      margin: EdgeInsets.symmetric(
        vertical: AppSizes.smallMargin(context),
        horizontal: AppSizes.mediumMargin(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white, // Fond blanc
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: AppSizes.mediumTextSize(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!isRead)
                Icon(
                  Icons.circle,
                  size: AppSizes.iconSize(context) * 0.8,
                  color: AppColors.primary,
                ),
            ],
          ),
          // SizedBox(height: AppSizes.smallMargin(context) * 0.5),
          Text(
            author,
            style: TextStyle(
              fontSize: AppSizes.smallTextSize(context),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: AppSizes.smallMargin(context)),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontSize: AppSizes.smallTextSize(context)),
          ),
          SizedBox(height: AppSizes.mediumPadding(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedDate,
                style: TextStyle(
                  fontSize: AppSizes.smallTextSize(context),
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.transfer_within_a_station_rounded,
                        size: AppSizes.iconSize(context) * 0.8,
                        color: Colors.grey,
                      ),
                      SizedBox(width: AppSizes.smallMargin(context)),
                      Text(
                        '$shareCount',
                        style: TextStyle(
                          fontSize: AppSizes.smallTextSize(context),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: AppSizes.mediumMargin(context)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.smallPadding(context),
                      vertical: AppSizes.smallPadding(context) / 2,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status),
                      borderRadius:
                          BorderRadius.circular(AppSizes.smallRadius(context)),
                    ),
                    child: Text(
                      _getStatusLabel(status),
                      style: TextStyle(
                        fontSize: AppSizes.smallTextSize(context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Divider(),
        ],
      ),
    );
  }

  Color _getStatusColor(UserRequestStatus status) {
    switch (status) {
      case UserRequestStatus.send:
        return Colors.orange;
      case UserRequestStatus.finish:
        return Colors.green;
      case UserRequestStatus.working:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _getStatusLabel(UserRequestStatus status) {
    switch (status) {
      case UserRequestStatus.send:
        return 'En cours';
      case UserRequestStatus.finish:
        return 'Publié';
      case UserRequestStatus.working:
        return 'En révision';
      default:
        return 'Inconnu';
    }
  }
}
