/** Class: Language
  * Handles Language toggles
  */
function Language(){
  
  /** Method: spanish()
    * Basic language change if-statements
    * @param text - the text to translate to Spanish
    * @return the Spanish translation of the text
    */
  this.spanish = function(words){
    if(words === "SCORE"){
      return "PUNTOS";
    } else if (words === "HIGH SCORE") {
      return "PUNTUACIÓN MÁS ALTA";
    } else if(words === "FLAPPY BIRD"){
      return "PAJARO VOLADOR";
    } else if(words === "START"){
      return "COMENZAR";
    } else if(words === "SPANISH"){
      return "ENGLISH";
    } else if(words === "GAME OVER"){
      return "JUEGO TERMINADO";
    } else if (words === "RESTART") {
      return "REINICIAR";
    }
    return words;
  }
  
  /** Method: toSpanishCheck()
    * Checks if language is set to Spanish and 
    * returns text based on current toggle
    * @param input - the text to be checked
    * @param spanish - the language toggle
    * @return String - Spanish variant of text if toggle is true
    */
  this.toSpanishCheck = function(input, spanish) {
    if (spanish) {
      return this.spanish(input);
    } else {
      return input;
    }
  }
}
