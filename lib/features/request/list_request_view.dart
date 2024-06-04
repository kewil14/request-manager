import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:request_manager/routes/name_route.dart';
import 'package:request_manager/utils/constant/app_assets.dart';
import 'package:request_manager/utils/constant/app_colors.dart';
import 'package:request_manager/utils/constant/app_size.dart';
import 'package:request_manager/utils/enums/user_request_state.dart';
import 'package:request_manager/widgets/components/user_request_card.dart';

class ListRequestScreen extends StatefulWidget {
  const ListRequestScreen({super.key});

  @override
  State<ListRequestScreen> createState() => _ListRequestScreenState();
}

class _ListRequestScreenState extends State<ListRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4, // Nombre d'onglets
        child: Scaffold(
          appBar: AppBar(
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
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tout'),
                Tab(text: 'Envoi'),
                Tab(text: 'Encour'),
                Tab(text: 'Terminer'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ArticleItem(
                    title: 'Absence de note article',
                    author: 'Dr. Monthe',
                    description:
                        'Ceci est la description de mon article., Ceci est la description de mon article., Ceci est la description de mon article.Ceci est la description de mon article.Ceci est la description de mon article.',
                    status: UserRequestStatus.finish,
                    publishedDate: DateTime.now(),
                    isRead: false,
                    shareCount: 12,
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ArticleItem(
                    title: 'Absence de note article',
                    author: 'Dr. Monthe',
                    description:
                        'Ceci est la description de mon article., Ceci est la description de mon article., Ceci est la description de mon article.Ceci est la description de mon article.Ceci est la description de mon article.',
                    status: UserRequestStatus.finish,
                    publishedDate: DateTime.now(),
                    isRead: false,
                    shareCount: 12,
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ArticleItem(
                    title: 'Absence de note article',
                    author: 'Dr. Monthe',
                    description:
                        'Ceci est la description de mon article., Ceci est la description de mon article., Ceci est la description de mon article.Ceci est la description de mon article.Ceci est la description de mon article.',
                    status: UserRequestStatus.finish,
                    publishedDate: DateTime.now(),
                    isRead: false,
                    shareCount: 12,
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ArticleItem(
                    title: 'Absence de note article',
                    author: 'Dr. Monthe',
                    description:
                        'Ceci est la description de mon article., Ceci est la description de mon article., Ceci est la description de mon article.Ceci est la description de mon article.Ceci est la description de mon article.',
                    status: UserRequestStatus.finish,
                    publishedDate: DateTime.now(),
                    isRead: false,
                    shareCount: 12,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ici, vous pouvez ajouter la logique pour gérer la nouvelle requête
          context.pushNamed(AppRoutes.add_request);
        },
        tooltip: 'Ajouter une nouvelle requête',
        child: Icon(Icons.add),
      ),
    );
  }
}
