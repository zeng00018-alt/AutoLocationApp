import 'package:flutter/material.dart';

class MesReservationsPage extends StatefulWidget {
  const MesReservationsPage({super.key});

  @override
  State<MesReservationsPage> createState() => _MesReservationsPageState();
}

class _MesReservationsPageState extends State<MesReservationsPage> {
  // Correction du type de la liste ici : List>
  final List<Map<String, dynamic>> _reservationsActives = [
    {
      'id': 'RES-2026-089',
      'vehicule': 'Renault Clio 5',
      'dates': '12/11/2026 ➔ 15/11/2026',
      'avecChauffeur': true,
      'statut': 'En cours',
      'montantTotal': 360.0,
      'lieuPrise': 'Nabeul Centre',
      'chauffeurNom': 'Sami Ben Ali',
    },
  ];

  final List<Map<String, dynamic>> _historiqueReservations = [
    {
      'id': 'RES-2026-042',
      'vehicule': 'Hyundai Tucson',
      'dates': '02/10/2026 ➔ 05/10/2026',
      'avecChauffeur': false,
      'statut': 'Terminée',
      'montantTotal': 540.0,
      'lieuPrise': 'Aéroport Tunis-Carthage',
    },
  ];

  // Boîte de dialogue pour le suivi en temps réel & reçu numérique
  void _afficherSuiviLocation(Map<String, dynamic> resa) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suivi - ${resa['id']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                  Chip(
                    label: Text(
                      resa['statut'],
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    backgroundColor: Colors.green.shade700,
                  ),
                ],
              ),
              const Divider(height: 24),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.directions_car, color: Color(0xFF1E3A8A)),
                title: Text(resa['vehicule'], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Prise en charge : ${resa['lieuPrise']}'),
              ),
              if (resa['avecChauffeur'] == true)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.person_pin, color: Color(0xFF1E3A8A)),
                  title: Text('Chauffeur assigné : ${resa['chauffeurNom'] ?? 'En cours d\'attribution'}'),
                  subtitle: const Text('Position GPS synchronisée en temps réel'),
                ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.receipt_long, color: Color(0xFF1E3A8A)),
                      label: const Text(
                        'Reçu numérique',
                        style: TextStyle(color: Color(0xFF1E3A8A)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Reçu ${resa['id']} téléchargé.')),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A),
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.lock_open),
                      label: const Text('Déverrouiller'),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Signal de déverrouillage sans contact envoyé au véhicule.'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReservationCard(Map<String, dynamic> resa, {required bool estActive}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  resa['vehicule'],
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: estActive ? Colors.green.shade100 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    resa['statut'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: estActive ? Colors.green.shade800 : Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.date_range, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(resa['dates'], style: const TextStyle(color: Colors.black87)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  resa['avecChauffeur'] ? Icons.airline_seat_recline_normal : Icons.drive_eta,
                  size: 16,
                  color: const Color(0xFF1E3A8A),
                ),
                const SizedBox(width: 6),
                Text(
                  resa['avecChauffeur'] ? 'Avec chauffeur' : 'Sans chauffeur',
                  style: const TextStyle(
                    color: Color(0xFF1E3A8A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total : ${resa['montantTotal']} TND',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
                if (estActive)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => _afficherSuiviLocation(resa),
                    child: const Text('Suivi en direct'),
                  )
                else
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Module d\'évaluation véhicule/chauffeur ouvert.')),
                      );
                    },
                    child: const Text(
                      'Évaluer',
                      style: TextStyle(color: Color(0xFF1E3A8A), fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mes Réservations',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF1E3A8A),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'En cours'),
              Tab(text: 'Historique'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _reservationsActives.isEmpty
                  ? const Center(child: Text('Aucune réservation en cours.'))
                  : ListView.builder(
                      itemCount: _reservationsActives.length,
                      itemBuilder: (context, index) => _buildReservationCard(
                        _reservationsActives[index],
                        estActive: true,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _historiqueReservations.isEmpty
                  ? const Center(child: Text('Aucun historique disponible.'))
                  : ListView.builder(
                      itemCount: _historiqueReservations.length,
                      itemBuilder: (context, index) => _buildReservationCard(
                        _historiqueReservations[index],
                        estActive: false,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}