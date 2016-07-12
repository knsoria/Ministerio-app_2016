class ImageButtons extends Button {
  PImage base;
  PImage down;
  PImage currentimage;
  int objetos;  //#
  int posicion;
  int modo;
  int ID;
  boolean dependencia;
  String texto;
  String currenttexto;
  APMediaPlayer audio;

  ImageButtons(int iID,int imodo,int ix, int iy, int iw, int ih, PImage ibase, PImage idown){
    ID = iID;
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    modo = imodo;
    base = ibase;
    down = idown;
    currentimage = base;
    currenttexto = "";
  }
  
  ImageButtons(int iID,int iobjetos, int iposicion, PImage ibase, PImage idown, boolean idependencia, String itexto, APMediaPlayer iaudio){
    ID = iID;
    objetos = iobjetos;
    modo = 3;
    posicion = iposicion;
    base = ibase;
    down = idown;
    dependencia = idependencia;
    texto = itexto;
    currenttexto = "";
    audio = iaudio;
    
    float  k = anchoGlobal/(3*ibase.width);
    w = int(ibase.width*k);
    h = int(ibase.height*k);
    switch(objetos){
      case 0:    //2 sujetos
        switch(posicion){
          case 0:
            x = int(anchoGlobal/5);
            y = int(altoGlobal/5);
            break;
          case 1:
            x = int(anchoGlobal/2);
            y = int(altoGlobal/5);
            break;
        }
        break;
      case 1:    //3 sujetos
        switch(posicion){
          case 0:
            x = int(anchoGlobal/20);
            y = int(altoGlobal/5);
            break;
          case 1:
            x = int(anchoGlobal/2.9);
            y = int(altoGlobal/5);
            break;
          case 2:
            x = int(anchoGlobal/1.6);
            y = int(altoGlobal/5);
            break;
        }
        break;
      case 2:    //2 objetos
        switch(posicion){
          case 0:
            x = int(anchoGlobal/5);
            y = int(altoGlobal/3.5);
            break;
          case 1:
            x = int(anchoGlobal/2);
            y = int(altoGlobal/3.5);
            break;
        }
        break;
    }
    currentimage = base;
    currenttexto = "";
  }
  
  void update() {
    over();
    pressed();
    switch(modo){
      case 0:    //Menú pricipal
        if(pressed && (ID<=5)) {
          switch(ID) {
            case 0:      //Submenú Aymara
              activity = 1;
              break;
            case 1:      //Submenú Jaqaru
              activity = 40;
              break;
            case 2:      //Submenú Quechua
              activity = 79;
              break;
            case 3:      //Submenú Shipibo
              activity = 118;
              break;
            case 4:      //Submenú Matsiguenka
              activity = 157;
              break;
            case 5:      //Submenú Yine
              activity = 196;
              break;
          }
          currentimage = down;
        }
        else {
          currentimage = base;
        }
        break;
      case 1:    //Adelantar
        if(pressed) {
          activity++;
          currentimage = down;
        }
        else {
          currentimage = base;
        }
        break;
      case 2:    //Regresar
        if(pressed) {
          switch(ID){
            case 6:
              activity--;
              break;
            case 8:
              switch(--activity/39){
                case 0:
                  activity = 1;
                  break;
                case 1:
                  activity = 40;
                  break;
                case 2:
                  activity = 79;
                  break;
                case 3:
                  activity = 118;
                  break;
                case 4:
                  activity = 157;
                  break;
                case 5:
                  activity = 196;
                  break;
              }
              break;
            case 9:
              activity = 0;
              break;
          }
          currentimage = down;
        }
        else {
          currentimage = base;
        }
        break;
      case 3:    //Mostrar texto
       if(last_activity==activity) {
          if(dependencia == true){
             if(posicion == 1 && bloqueado == false && pressed){
               currentimage = down;  //evento activador
               currenttexto = texto;
               audio.start();
               //reproducir sonido por ID
             }
             if(posicion != 1 && pressed){
               bloqueado = false;
               currentimage = down;  //evento activador
               currenttexto = texto;
               audio.start();
               //reproducir sonido por ID
             }
          }
          else{
            if(pressed){
              currentimage = down;  //evento activador
              currenttexto = texto;
              audio.start();
              //reproducir sonido por ID
              }
          }
        }
        else {
          if (dependencia == true) {
            bloqueado = true;
          }
          else {
            bloqueado = false;
          }
          currentimage = base;
          currenttexto = "";
        }
        break;
    }
  }
  
  void over(){
    if( objetos == 1 ){
      if( overRect(x, y, w/2, h) ) { over = true; }
      else { over = false; }
    }
    else{
      if( overRect(x, y, w, h) ) { over = true; }
      else { over = false; }
    }
  }
  
  void display(){
    image(currentimage, x, y, w, h);
    fill(0);
    textFont(fontsubMenu,int(altoGlobal/28));
    if(objetos == 2){
      text(currenttexto,x+anchoGlobal/8,y-altoGlobal/30);
    }
    else{
      text(currenttexto,x+anchoGlobal/8,y+altoGlobal/60);
    }
    
    
  }
}
