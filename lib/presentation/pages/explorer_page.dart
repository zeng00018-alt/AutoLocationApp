import 'package:flutter/material.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher un véhicule (marque, modèle)...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // Filtres rapides (Catégories)
            const Text(
              'Catégories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  FiltreChip(label: 'Tous', estActif: true),
                  FiltreChip(label: 'Citadine', estActif: false),
                  FiltreChip(label: 'SUV', estActif: false),
                  FiltreChip(label: 'Berline', estActif: false),
                  FiltreChip(label: 'Avec chauffeur', estActif: false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Liste des véhicules (pour l'instant, un message temporaire)
            const Text(
              'Véhicules disponibles',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Text(
                  'La liste des véhicules s\'affichera ici prochainement.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget utilitaire pour les puces de filtres
class FiltreChip extends StatelessWidget {
  final String label;
  final bool estActif;

  const FiltreChip({super.key, required this.label, required this.estActif});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: estActif,
        onSelected: (value) {},
      ),
    );
  }
}