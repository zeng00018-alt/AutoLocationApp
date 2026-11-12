import 'package:flutter/material.dart';

class ReservationPaymentPage extends StatefulWidget {
  final bool withDriver;
  final DateTimeRange dateRange;

  const ReservationPaymentPage({
    super.key,
    required this.withDriver,
    required this.dateRange,
  });

  @override
  State<ReservationPaymentPage> createState() => _ReservationPaymentPageState();
}

class _ReservationPaymentPageState extends State<ReservationPaymentPage> {
  // Mode de paiement sélectionné ('carte', 'especes')
  String _modePaiement = 'especes';

  @override
  Widget build(BuildContext context) {
    // Calcul du nombre de jours
    final int nbJours = widget.dateRange.duration.inDays == 0 ? 1 : widget.dateRange.duration.inDays;
    const double prixJourBase = 90.0; // Exemple Renault Clio 5
    final double totalBase = prixJourBase * nbJours;
    final double totalChauffeur = widget.withDriver ? (30.0 * nbJours) : 0.0;
    final double montantTotal = totalBase + totalChauffeur;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paiement & Validation',
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
            // Section Récapitulatif
            const Text(
              'Récapitulatif de la réservation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Période :', style: TextStyle(fontWeight: FontWeight.w500)),
                      Text(
                        '${widget.dateRange.start.day}/${widget.dateRange.start.month} ➔ ${widget.dateRange.end.day}/${widget.dateRange.end.month}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Type de location :', style: TextStyle(fontWeight: FontWeight.w500)),
                      Text(
                        widget.withDriver ? 'Avec chauffeur' : 'Sans chauffeur',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: widget.withDriver ? const Color(0xFF1E3A8A) : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Montant Total estimé :', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                        '$montantTotal TND',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A8A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Section Mode de Paiement
            const Text(
              'Mode de paiement',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            RadioListTile<String>(
              title: const Text('Paiement en espèces (à la livraison)'),
              subtitle: const Text('Règlement direct lors de la prise du véhicule'),
              value: 'especes',
              groupValue: _modePaiement,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (val) => setState(() => _modePaiement = val!),
            ),
            RadioListTile<String>(
              title: const Text('Paiement en ligne sécurisé (Stripe)'),
              subtitle: const Text('Carte bancaire internationale ou locale'),
              value: 'carte',
              groupValue: _modePaiement,
              activeColor: const Color(0xFF1E3A8A),
              onChanged: (val) => setState(() => _modePaiement = val!),
            ),

            const SizedBox(height: 40),

            // Bouton de confirmation finale
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
                  // Action de confirmation de réservation
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Réservation confirmée !'),
                      content: const Text(
                        'Votre demande de location a bien été enregistrée. Retrouvez le suivi dans l\'onglet "Mes résas".',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                          child: const Text('OK', style: TextStyle(color: Color(0xFF1E3A8A))),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Confirmer et valider la réservation',
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