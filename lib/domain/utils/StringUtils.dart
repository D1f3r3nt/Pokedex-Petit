class StringUtils {
  static String toCapitalize(String str) {
    final firstLetter = str.substring(0,1);
    final word = str.substring(1);
    
    return firstLetter.toUpperCase() + word.toLowerCase();
  }

  static String formatIdPokemon(int id) {
    final String str = id.toString();

    return "#${str.padLeft(3, '0')}";
  }
}