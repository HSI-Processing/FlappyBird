/** Class: Language
  * Handles Language toggles
  * NOTE : This class should be nearly identical across all games
  */
public class Language{
  
  /** Method: spanish()
    * Basic language change if-statements
    * @param String
    * @return String
    */
  public String spanish(String text){
    if(text == "SCORE"){
      return "PUNTOS";
    }else if (text.equals("HIGH SCORE")) {
      return "PUNTUACIÓN MÁS ALTA";
    }else if(text == "FLAPPY BIRD"){
      return "PAJARO VOLADOR";
    }else if(text == "START"){
      return "COMENZAR";
    }else if(text == "SPANISH"){
      return "ENGLISH";
    }else if(text == "GAME OVER"){
      return "JUEGO TERMINADO";
    }else if (text.equals("RESTART")) {
      return "REINICIAR";
    }
    return text; // If no spanish variant available
  }
  
  /** Method: toSpanishCheck()
    * Checks if language is set to spanish and 
    * returns text based on current toggle
    * @param String, boolean
    * @return String - spanish variant of text
    */
  public String toSpanishCheck(String input, boolean spanish) {
    if (spanish) {
      return spanish(input);
    } else {
      return input;
    }
  }
}
