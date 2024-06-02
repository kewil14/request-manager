import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:request_manager/routes/name_route.dart';
import 'package:request_manager/utils/constant/app_assets.dart';
import 'package:request_manager/utils/constant/app_colors.dart';
import 'package:request_manager/utils/constant/app_size.dart';
import 'package:request_manager/utils/enums/user_request_state.dart';
import 'package:request_manager/widgets/components/app_title_section_card.dart';
import 'package:request_manager/widgets/components/document_card.dart';
import 'package:request_manager/widgets/components/user_request_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> articles = [
    {
      'title': 'Flutter: Le Guide Ultime',
      'author': 'Dr. Monthe',
      'description':
          'Apprenez tout sur Flutter et développez des applications mobiles performantes.',
      'status': UserRequestStatus.finish,
      'publishedDate': DateTime(2023, 10, 26),
      'isRead': false,
    },
    {
      'title': 'Dart: La base de Flutter',
      'author': 'Jane Smith',
      'description':
          'Maîtrisez le langage Dart pour écrire du code Flutter efficace.',
      'status': UserRequestStatus.send,
      'publishedDate': DateTime(2023, 11, 15),
      'isRead': true,
    },
    // Ajoutez plus d'articles ici...
  ];

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSizes.mediumMargin(context)),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSizes.mediumMargin(context),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(AppSizes.smallTextSize(context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Astuce du jour !",
                        style: TextStyle(
                          fontSize: AppSizes.largeTextSize(context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.mediumMargin(context)),
                    Text(
                      "Comment modifier son mot de passe ?",
                      style: TextStyle(
                        fontSize: AppSizes.mediumTextSize(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: AppSizes.smallMargin(context)),
                    Text(
                      "Afin de modifier votre mot de passe ouvrez la partie profil de l'application le dernier boutons du menu et cliquer sur modifier mon mot de passe, completer les informations et soumettez vos information...",
                      style: TextStyle(
                        fontSize: AppSizes.smallTextSize(context),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.mediumMargin(context)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.mediumMargin(context),
                ),
                child: AppTitleSection(
                  title: "Nouvea Document",
                  onTap: () {
                    context.pushNamed(AppRoutes.list_ressources);
                  },
                ),
              ),
              SizedBox(height: AppSizes.smallMargin(context)),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.smallMargin(context)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      10,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? AppSizes.smallMargin(context) : 0,
                          right: AppSizes.mediumMargin(context),
                        ),
                        child: DocumentCard(
                          number_download: 10,
                          imageUrl:
                              "https://shootersjournal.net/wp-content/uploads/2019/04/simple-employment-contract-template-free-awesome-basic-employment-contract-template-free-templates-of-simple-employment-contract-template-free.jpg",
                          title: "Examen de developpement mobile , en flutter",
                          height: AppSizes.smallCardHeight(context),
                          width: AppSizes.smallCardHeight(context) * 0.9,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.mediumMargin(context)),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.mediumMargin(context),
                  // vertical: AppSizes.smallMargin(context),
                ),
                child: AppTitleSection(
                  title: "Requête récentes",
                  onTap: () {
                    context.pushNamed(AppRoutes.list_ressources);
                  },
                ),
              ),
              ArticleItem(
                title: 'Absence de note article',
                author: 'Dr. Monthe',
                description:
                    'Ceci est la description de mon article., Ceci est la description de mon article., Ceci est la description de mon article.Ceci est la description de mon article.Ceci est la description de mon article.',
                status: UserRequestStatus.finish,
                publishedDate: DateTime.now(),
                isRead: false,
                shareCount: 12,
              ),
              ArticleItem(
                title: 'Absence de note article',
                author: 'Dr. Monthe',
                description: 'Ceci est la description de mon article.',
                status: UserRequestStatus.finish,
                publishedDate: DateTime.now(),
                isRead: false,
                shareCount: 12,
              )
              // ...articles
              //     .map((article) => ArticleItem(
              //           title: article['title'],
              //           author: article['author'],
              //           description: article['description'],
              //           status: article['status'],
              //           publishedDate: article['publishedDate'],
              //           isRead: article['isRead'],
              //         ))
              //     .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
