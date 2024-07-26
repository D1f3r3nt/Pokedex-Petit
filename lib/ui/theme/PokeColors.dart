import 'dart:ui';

class PokeColors {
  static Color officialRed = Color(0xFFff0000);
  
  static Color bug = Color(0xFF94bc4a);
  static Color dark = Color(0xFF736c75);
  static Color dragon = Color(0xFF6a7baf);
  static Color electric = Color(0xFFe5c531);
  static Color fairy = Color(0xFFe397d1);
  static Color fighting = Color(0xFFcb5f48);
  static Color fire = Color(0xFFea7a3c);
  static Color flying = Color(0xFF7da6de);
  static Color ghost = Color(0xFF846ab6);
  static Color grass = Color(0xFF71c558);
  static Color ground = Color(0xFFcc9f4f);
  static Color ice = Color(0xFF70cbd4);
  static Color normal = Color(0xFFaab09f);
  static Color poison = Color(0xFFb468b7);
  static Color psychic = Color(0xFFe5709b);
  static Color rock = Color(0xFFb2a061);
  static Color steel = Color(0xFF89a1b0);
  static Color water = Color(0xFF539ae2);
  
  static Color of(String str) {
    switch (str) {
      case 'bug': return PokeColors.bug;
      case 'dark': return PokeColors.dark;
      case 'dragon': return PokeColors.dragon;
      case 'electric': return PokeColors.electric;
      case 'fairy': return PokeColors.fairy;
      case 'fighting': return PokeColors.fighting;
      case 'fire': return PokeColors.fire;
      case 'flying': return PokeColors.flying;
      case 'ghost': return PokeColors.ghost;
      case 'grass': return PokeColors.grass;
      case 'ground': return PokeColors.ground;
      case 'ice': return PokeColors.ice;
      case 'normal': return PokeColors.normal;
      case 'poison': return PokeColors.poison;
      case 'psychic': return PokeColors.psychic;
      case 'rock': return PokeColors.rock;
      case 'steel': return PokeColors.steel;
      case 'water': return PokeColors.water;
      default: return PokeColors.officialRed;
    }
  }
}