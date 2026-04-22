class Plat{
  String nom;
  double prix;
  bool vegetarien;

  Plat(this.nom, this.prix, this.vegetarien) {
    if (prix < 0) {
      throw ArgumentError("Le prix ne peut pas être négatif");
    }
  }

  @override
  // pèmèt mwen afiche plat a yo nan console s
  String toString() {
    return "$nom - $prix\$ - ${vegetarien ? "Végétarien" : "Non-végétarien"}";
  }
}