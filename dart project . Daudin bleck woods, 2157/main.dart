import 'dart:io';
import 'lib/models/plat.dart';
import 'lib/models/plat_special.dart';
import 'services/restaurant_service.dart';

void main() {
  var service = RestaurantService();
  var commande = <Plat>[];

  while (true) {
    print("\nMenu:");
    print("1. Afficher les plats");
    print("2. Ajouter un plat");
    print("3. Ajouter un plat à la commande");
    print("4. Afficher la commande");
    print("5. Filtrer les plats");
    print("6. Calculer le total");
    print("7. Quitter");

    var choix = stdin.readLineSync();

    switch (choix) {
      case "1":
        service.afficherPlats();
        break;
      case "2":
        print("Nom du plat:");
        var nom = stdin.readLineSync()!;
        print("Prix:");
        var prix = double.parse(stdin.readLineSync()!);
        print("Végétarien? (o/n):");
        var veg = stdin.readLineSync() == "o";
        service.ajouterPlat(Plat(nom, prix, veg));
        break;
      case "3":
        print("Nom du plat à commander :");
String? input = stdin.readLineSync();
if (input == null || input.isEmpty) {
  print("Erreur: vous devez entrer un nom de plat.");
} else {
  var plat = service.menu.firstWhere(
    (p) => p.nom == input,
    orElse: () => throw Exception("Plat inexistant"),
  );
  commande.add(plat);
  print("Plat ajouté à la commande !");
}      
        commande.add(Plat as Plat);
        break;
      case "4":
        commande.forEach(print);
        break;
      case "5":
        print("Filtrer: 1=végétariens, 2=non-végétariens, 3=prix > X");
        var f = stdin.readLineSync();
        if (f == "1") service.filtrerVegetariens();
        else if (f == "2") service.filtrerNonVegetariens();
        else if (f == "3") {
          print("Entrer X:");
          var x = double.parse(stdin.readLineSync()!);
          service.filtrerPrix(x);
        }
        break;
      case "6":
        var total = commande.fold<double>(0, (sum, p) {
          if (p is PlatSpecial) return sum + p.prixReduit();
          return sum + p.prix;
        });
        print("Total: $total\$");
        break;
      case "7":
        print("Au revoir!");
        return;
      default:
        print("Choix invalide");
    }
  }
}