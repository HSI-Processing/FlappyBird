public class Language{
  
  public String spanish(String text){
    if(text == "Score: "){
      return "Puntos: ";
    }else if(text == "FLAPPY BIRD"){
      return "PAJARO VOLADOR";
    }else if(text == "START"){
      return "COMENZAR";
    }else if(text == "SPANISH"){
      return "ENGLISH";
    }else if(text == "Press R to Restart or Q to Quit"){
      return "Presione R para Reiniciar o Q para Salir";
    }else if(text == "GAME OVER"){
      return "JUEGO TERMINADO";
    }
    return null;
  }
  
  public String english(String text){
    if(text == "Puntos: "){
      return "Score: ";
    }else if(text == "PAJARO VOLADOR"){
      return "FLAPPY BIRD";
    }else if(text == "COMENZAR"){
      return "START";
    }else if(text == "ENGLISH"){
      return "SPANISH";
    }else if(text == "Presione R para Reiniciar o Q para Salir"){
      return "Press R to Restart or Q to Quit";
    }else if(text == "JUEGO TERMINADO"){
      return "GAME OVER";
    }
    return null;
  }
  
  // could be an override method
  public String toSpanishCheck(String input){
    String text = input;
    if(spanish){
      text = spanish(text);
    }
    return text;
  }
    
}
