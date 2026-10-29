class Utilisateur {
  final String id;
  final String nom;
  final String email;
  final String telephone;
  final String role; // 'client', 'chauffeur', 'admin'
  final bool permisVerifie;

  Utilisateur({
    required this.id,
    required this.nom,
    required this.email,
    required this.telephone,
    required this.role,
    this.permisVerifie = false,
  });
}