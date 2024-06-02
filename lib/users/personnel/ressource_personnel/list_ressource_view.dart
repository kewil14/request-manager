import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:request_manager/utils/constant/app_assets.dart';
import 'package:request_manager/utils/constant/app_colors.dart';
import 'package:request_manager/utils/constant/app_size.dart';
import 'package:request_manager/widgets/loaders/default_loader.dart';

class ListRessourceScreen extends StatefulWidget {
  const ListRessourceScreen({super.key});

  @override
  State<ListRessourceScreen> createState() => _ListRessourceScreenState();
}

class _ListRessourceScreenState extends State<ListRessourceScreen> {
  String? selectedTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: Image.asset(
          AppAssets.logo,
        ),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "REQUEST MANAGER",
            style: TextStyle(
              fontSize: AppSizes.smallTextSize(context),
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
              text: 'Welcome, ',
              style: TextStyle(
                fontSize: AppSizes.largeTextSize(context),
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Delano",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSizes.mediumMargin(context) * 1.5),
          Padding(
            padding: EdgeInsets.symmetric(
              // vertical: AppSizes.smallMargin(context) * 0.5,
              horizontal: AppSizes.mediumMargin(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mes ressources",
                  style: TextStyle(
                    fontSize: AppSizes.largeTextSize(context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                DropdownButton<String>(
                  hint: Text("Quel matiere ?"),
                  value: selectedTag,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTag = newValue;
                    });
                  },
                  items: <String>['Tag 1', 'Tag 2', 'Tag 3', 'Tag 4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          SizedBox(height: AppSizes.mediumMargin(context)),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: AppSizes.smallCardHeight(context),
                  width: double.infinity,
                  padding: EdgeInsets.all(AppSizes.smallMargin(context)),
                  margin: EdgeInsets.symmetric(
                    vertical: AppSizes.smallMargin(context),
                    horizontal: AppSizes.mediumMargin(context),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://shootersjournal.net/wp-content/uploads/2019/04/simple-employment-contract-template-free-awesome-basic-employment-contract-template-free-templates-of-simple-employment-contract-template-free.jpg",
                        imageBuilder: (context, imageProvider) => Container(
                          height: AppSizes.smallCardHeight(context),
                          width: AppSizes.smallCardHeight(context) * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => DefaultLoader(
                          height: AppSizes.smallCardHeight(context),
                          width: AppSizes.smallCardHeight(context) * 0.9,
                          borderRaduis: 10,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Theorie des graphes",
                              style: TextStyle(
                                fontSize:
                                    AppSizes.mediumTextSize(context) * 0.85,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Pr. Ndoundam",
                              style: TextStyle(
                                fontSize: AppSizes.smallTextSize(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                                height: AppSizes.smallMargin(context) * .8),
                            Text(
                              "Je suis un developpeur fullstack specialiser dans la realisaton des application mobile et la conception des plateformes logiciel",
                              style: TextStyle(
                                fontSize: AppSizes.smallTextSize(context),
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('d MMM yyyy', "fr_FR")
                                      .format(DateTime.now()),
                                  style: TextStyle(
                                    fontSize: AppSizes.smallTextSize(context),
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontSize:
                                            AppSizes.smallTextSize(context),
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(
                                      Icons.download,
                                      size: AppSizes.iconSize(context) * 0.6,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
