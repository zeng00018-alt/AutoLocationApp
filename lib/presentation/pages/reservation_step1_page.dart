import 'package:flutter/material.dart';

class ReservationStep1Page extends StatefulWidget {
  const ReservationStep1Page({super.key});

  @override
  State<ReservationStep1Page> createState() => _ReservationStep1PageState();
}

class _ReservationStep1PageState extends State<ReservationStep1Page> {
  // Variables d'état pour la période de location et le choix du chauffeur
  DateTimeRange? _selectedDateRange;
  bool _withDriver = false;

  // Fonction pour afficher le calendrier de sélection de la période (Date de début et de fin)
  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1E3A8A), // Bleu de nuit principal
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Réservation - Étape 1',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choisissez vos dates de location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Carte interactive pour ouvrir le sélecteur de dates
            InkWell(
              onTap: () => _selectDateRange(context),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Color(0xFF1E3A8A)),
                        const SizedBox(width: 12),
                        Text(
                          _selectedDateRange == null
                              ? 'Sélectionner les dates'
                              : '${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month}/${_selectedDateRange!.start.year} ➔ ${_selectedDateRange!.end.day}/${_selectedDateRange!.end.month}/${_selectedDateRange!.end.year}',
                          style: TextStyle(
                            fontSize: 16,
                            color: _selectedDateRange == null ? Colors.grey : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Type de location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Option cruciale du cahier des charges : Location avec ou sans chauffeur
            SwitchListTile(
              title: const Text(
                'Louer avec chauffeur',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text('Un chauffeur professionnel certifié sera assigné à votre trajet'),
              value: _withDriver,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (bool value) {
                setState(() {
                  _withDriver = value;
                });
              },
            ),

            const Spacer(),

            // Bouton de validation pour passer à l'étape suivante (Partie 9)
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
                onPressed: _selectedDateRange == null
                    ? null // Désactivé tant que les dates ne sont pas renseignées
                    : () {
                        // TODO: Navigation vers la Partie 9 (Options et Assurances)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Dates et mode de location validés ! Passage à l\'étape 2.'),
                          ),
                        );
                      },
                child: const Text(
                  'Continuer vers les options',
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