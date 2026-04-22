import 'plat.dart';

class PlatSpecial extends Plat {
  double reduction; // eg: 0.2 = 20%

  PlatSpecial(String nom, double prix, bool vegetarien, this.reduction)
      : super(nom, prix, vegetarien) {
    if (reduction < 0 || reduction > 1) {
      throw ArgumentError("La réduction doit être entre 0 et 1");
    }
  }

  double prixReduit() {
    return prix - (prix * reduction);
  }

  @override
  String toString() {
    return "$nom (spécial) - Prix original: $prix\$ - Prix réduit: ${prixReduit()}\$";
  }
}