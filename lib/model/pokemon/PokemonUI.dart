import 'PokemonResponse.dart';

class PokemonUI {
  String name;
  int id;
  late String image;
  List<String> elements;
  int weight;
  late double height;
  List<Stat> info;
  String type;

  PokemonUI({
    required this.name,
    required this.id,
    required String? image,
    required this.elements,
    required this.weight,
    required int height,
    required this.info,
    required this.type
  }) {
    this.image = (image == null) ? "https://www.quizexpo.com/wp-content/uploads/2019/09/1-1.jpg" : image;
  }
}