import 'package:flutter/material.dart';
import 'vehicule_card.dart';
import 'vehicule_detail_page.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  // Catégorie sélectionnée par défaut
  String _categorieActuelle = 'Tous';

  // Liste complète de tous nos véhicules de test
  final List<Map<String, dynamic>> _tousLesVehicules = [
    {'modele': 'Renault Clio 5', 'type': 'Citadine', 'prix': 90.0},
    {'modele': 'Hyundai Tucson', 'type': 'SUV', 'prix': 180.0},
    {'modele': 'Peugeot 308', 'type': 'Berline', 'prix': 120.0},
    {'modele': 'Volkswagen Golf 8', 'type': 'Berline', 'prix': 150.0},
  ]; 

  @override
  Widget build(BuildContext context) {
    // Filtrer la liste selon la catégorie choisie
    final vehiculesAffiches = _categorieActuelle == 'Tous'
        ? _tousLesVehicules
        : _tousLesVehicules.where((v) => v['type'] == _categorieActuelle).toList();

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
                prefixIcon: const Icon(Icons.search, color: Color(0xFF1E3A8A)),
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
                fontFamily: 'Roboto', // Conforme aux polices recommandées
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFiltreChip('Tous'),
                  _buildFiltreChip('Citadine'),
                  _buildFiltreChip('SUV'),
                  _buildFiltreChip('Berline'),
                  _buildFiltreChip('Avec chauffeur'), // Ajout conforme au cahier des charges
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Titre dynamique de la liste
            Text(
              'Véhicules disponibles (${vehiculesAffiches.length})',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Liste dynamique des véhicules filtrés
            Expanded(
              child: vehiculesAffiches.isEmpty
                  ? const Center(
                      child: Text(
                        'Aucun véhicule trouvé pour cette catégorie',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: vehiculesAffiches.length,
                      itemBuilder: (context, index) {
                        final vehicule = vehiculesAffiches[index];
                        return VehiculeCard(
                          marqueModele: vehicule['modele'],
                          type: vehicule['type'],
                          prixJour: vehicule['prix'],
                          imagePath: '',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VehiculeDetailPage(
                                  modele: vehicule['modele'],
                                  type: vehicule['type'],
                                  prixJour: vehicule['prix'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper pour construire un chip de filtre interactif aux couleurs de la charte
  Widget _buildFiltreChip(String label) {
    final estActif = _categorieActuelle == label;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: estActif,
        selectedColor: const Color(0xFF1E3A8A).withOpacity(0.15),
        backgroundColor: Colors.grey[100],
        labelStyle: TextStyle(
          color: estActif ? const Color(0xFF1E3A8A) : Colors.black87,
          fontWeight: estActif ? FontWeight.bold : FontWeight.normal,
        ),
        onSelected: (bool selected) {
          setState(() {
            _categorieActuelle = label;
          });
        },
      ),
    );
  }
}