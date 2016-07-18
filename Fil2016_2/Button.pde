class Button
{
  int x, y;
  int w, h;
  boolean over = false;
  boolean pressed = false;
  boolean beforepressed = false;  
  
  void pressed() {
    
    if(beforepressed && !mousePressed){
      pressed = true;
      last_activity = activity;
    } else {
      pressed = false;
    }   
    
    if(over && mousePressed){
      beforepressed = true;
    } else {
      beforepressed = false;
    }    
  }
  
  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
      return true;
    }
    else {
      return false;
    }
  }
}
