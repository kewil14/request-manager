import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final String? message;
  final VoidCallback onRefresh;
  const NoDataFound({super.key, this.message, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 150,
            color: Colors.blueGrey.withOpacity(0.2),
          ),
          const SizedBox(height: 16),
          Text(
            message ??
                "Aucune donnees trouvees, \n verifier votre connexion puis \n cliquer sur le bouton si dessous pour rafraichir...",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: onRefresh,
            icon: const Icon(
              Icons.refresh,
              size: 80,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
