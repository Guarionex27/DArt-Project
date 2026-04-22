import '../lib/models/plat.dart';


class RestaurantService{
  List<Plat> menu = [];

  void ajouterPlat( plat) {
    menu.add(plat);
  }

  void afficherPlats() {
    for (var plat in menu) {
      print(plat);
    }
  }

  void filtrerVegetariens() {
    menu.where((p) => p.vegetarien).forEach((p) => print(p));
  }

  void filtrerNonVegetariens() {
    menu.where((p) => !p.vegetarien).forEach((p) => print(p));
  }

  void filtrerPrix(double x) {
    menu.where((p) => p.prix > x).forEach((p) => print(p));
  }
}