import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:request_manager/utils/constant/app_assets.dart';
import 'package:request_manager/utils/constant/app_size.dart';
import 'package:request_manager/widgets/loaders/default_loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          AppAssets.logo,
        ),
        title: Text("Mon profil"),
        actions: [
          Icon(Icons.mode_edit_rounded),
          SizedBox(
            width: AppSizes.smallMargin(context),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: AppSizes.mediumMargin(context)),
          CachedNetworkImage(
            imageUrl:
                "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg",
            imageBuilder: (context, imageProvider) => Container(
              height: AppSizes.smallCardHeight(context),
              width: AppSizes.smallCardHeight(context),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppSizes.smallCardHeight(context)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => DefaultLoader(
              height: AppSizes.smallCardHeight(context),
              width: AppSizes.smallCardHeight(context),
              borderRaduis: AppSizes.smallCardHeight(context),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(height: AppSizes.smallMargin(context)),
          Text(
            "19K2819",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AppSizes.largeTextSize(context),
            ),
          ),
          SizedBox(height: AppSizes.mediumMargin(context)),
          ListTile(
            title: Text(
              "Nom",
              style: TextStyle(
                // fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: AppSizes.mediumTextSize(context),
              ),
            ),
            subtitle: Text(
              "TOUNGSI YOUMBISSI Delano Roosvelt",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.largeTextSize(context) * 0.8,
                // color:
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title: Text(
                      "Filiere",
                      style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: AppSizes.mediumTextSize(context),
                      ),
                    ),
                    subtitle: Text(
                      "Science de l'education",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.largeTextSize(context) * 0.8,
                        // color:
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.mediumMargin(context)),
                Flexible(
                  flex: 2,
                  child: ListTile(
                    title: Text(
                      "Niveau",
                      style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: AppSizes.mediumTextSize(context),
                      ),
                    ),
                    subtitle: Text(
                      "Licence 1",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.largeTextSize(context) * 0.8,
                        // color:
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text("Profile Screen"),
          ),
        ],
      ),
    );
  }
}
