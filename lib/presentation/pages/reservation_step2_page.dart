import 'package:flutter/material.dart';

class ReservationStep2Page extends StatefulWidget {
  final bool withDriver;
  final DateTimeRange dateRange;

  const ReservationStep2Page({
    super.key,
    required this.withDriver,
    required this.dateRange,
  });

 // (on utilise State standard ci-dessous)
  @override
  State<ReservationStep2Page> createState() => _ReservationStep2PageState();
}

class _ReservationStep2PageState extends State<ReservationStep2Page> {
  // Options sélectionnées
  bool _optionGps = false;
  bool _optionSiegeBebe = false;
  bool _optionConducteurSup = false;

  // Formule d'assurance sélectionnée ('base', 'intermediaire', 'premium')
  String _assuranceType = 'base';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Réservation - Étape 2',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre section Options
            const Text(
              'Options supplémentaires',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            CheckboxListTile(
              title: const Text('GPS Intégré'),
              subtitle: const Text('15 TND / jour'),
              value: _optionGps,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (val) => setState(() => _optionGps = val ?? false),
            ),
            CheckboxListTile(
              title: const Text('Siège Bébé'),
              subtitle: const Text('10 TND / jour'),
              value: _optionSiegeBebe,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (val) => setState(() => _optionSiegeBebe = val ?? false),
            ),
            CheckboxListTile(
              title: const Text('Conducteur additionnel'),
              subtitle: const Text('20 TND / jour'),
              value: _optionConducteurSup,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (val) => setState(() => _optionConducteurSup = val ?? false),
            ),

            const Divider(height: 40),

            // Titre section Assurances (Exigé par le cahier des charges)
            const Text(
              'Formule d\'assurance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            RadioListTile<String>(
              title: const Text('Assurance Base (Tiers)'),
              subtitle: const Text('Inclus dans le tarif de base'),
              value: 'base',
              groupValue: _assuranceType,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (val) => setState(() => _assuranceType = val!),
            ),
            RadioListTile<String>(
              title: const Text('Assurance Intermédiaire'),
              subtitle: const Text('Franchise réduite - 25 TND / jour'),
              value: 'intermediaire',
              groupValue: _assuranceType,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (val) => setState(() => _assuranceType = val!),
            ),
            RadioListTile<String>(
              title: const Text('Assurance Premium (Tous risques)'),
              subtitle: const Text('Zéro franchise - 50 TND / jour'),
              value: 'premium',
              groupValue: _assuranceType,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (val) => setState(() => _assuranceType = val!),
            ),

            const SizedBox(height: 40),

            // Bouton pour passer au paiement (Partie 10)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // TODO: Navigation vers l'écran de Paiement sécurisé
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Options et assurance enregistrées ! Passage au paiement.'),
                    ),
                  );
                },
                child: const Text(
                  'Continuer vers le paiement',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}