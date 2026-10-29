class Location {
  final String id;
  final String clientId;
  final String vehiculeId;
  final String? chauffeurId;
  final DateTime dateDebut;
  final DateTime dateFin;
  final double prixTotal;
  final String statut; // Ex: 'en_cours', 'termine', 'annule'

  Location({
    required this.id,
    required this.clientId,
    required this.vehiculeId,
    this.chauffeurId,
    required this.dateDebut,
    required this.dateFin,
    required this.prixTotal,
    required this.statut,
  });
}