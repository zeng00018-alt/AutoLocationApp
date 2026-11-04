import 'package:flutter/material.dart';

class VehiculeDetailPage extends StatelessWidget {
  final String modele;
  final String type;
  final double prixJour;

  const VehiculeDetailPage({
    super.key,
    required this.modele,
    required this.type,
    required this.prixJour,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(modele),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grande image d'en-tête (ou conteneur provisoire)
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.directions_car, size: 100, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom et Type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        modele,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Chip(
                        label: Text(type),
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Prix par jour
                  Text(
                    '$prixJour TND / jour',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Divider(height: 30),

                  // Caractéristiques rapides
                  const Text(
                    'Caractéristiques',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CaracItem(icon: Icons.settings, label: 'Boîte Manuelle'),
                      CaracItem(icon: Icons.local_gas_station, label: 'Essence'),
                      CaracItem(icon: Icons.airline_seat_recline_normal, label: '5 Places'),
                    ],
                  ),
                  const Divider(height: 30),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Véhicule en excellent état, climatisé, idéal pour vos déplacements urbains et vos longs trajets en toute sécurité. Entretien régulier garanti.',
                    style: TextStyle(color: Colors.grey[700], height: 1.5),
                  ),
                  const SizedBox(height: 40),

                  // Bouton de réservation
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Demande de réservation enregistrée !'),
                          ),
                        );
                      },
                      child: const Text(
                        'Réserver ce véhicule',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget utilitaire pour les caractéristiques
class CaracItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CaracItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.grey[700]),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}