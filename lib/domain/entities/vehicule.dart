class Vehicule {
  final String id;
  final String marque;
  final String modele;
  final double prixJour;
  final double caution;
  final int annee;
  final String immatriculation;
  final List<String> photos;
  final bool estDisponible;

  Vehicule({
    required this.id,
    required this.marque,
    required this.modele,
    required this.prixJour,
    required this.caution,
    required this.annee,
    required this.immatriculation,
    required this.photos,
    this.estDisponible = true,
  });
}