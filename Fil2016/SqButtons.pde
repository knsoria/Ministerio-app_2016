class SqButtons extends Button {
  color TXT = 255;
  String SUBMENU,submenu;
  int min_x, min_y, ID;
 
  SqButtons(int iID, String iSUBMENU, String isubmenu, int imin_x,int imin_y) {
    SUBMENU = iSUBMENU;
    submenu = isubmenu;
    ID = iID;
    min_x = imin_x;
    min_y = imin_y;
    
    w = 3*min_x;
    h = 2*min_y;
    switch(ID%6){
      case 0:
        x = min_x;    y = 4*min_y;
        break;
      case 1:
        x = 5*min_x;  y = 4*min_y;
        break;
      case 2:
        x = min_x;    y = 7*min_y;
        break;
      case 3:
        x = 5*min_x;  y = 7*min_y;
        break;
      case 4:
        x = min_x;    y = 10*min_y;
        break;
      case 5:
        x = 5*min_x;  y = 10*min_y;
        break;
      default:
        x = 0;  y = 0;
    }
  }
  
  void update() {
    over();
    pressed();
    if(pressed){
      switch(ID){
        case 0:    //Submenú Aymara || Saludándonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[0]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[0]+str(i)+".png");
            }
            p1.setMediaFile("a01.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("a02.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("a03.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("a04.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("a05.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("a06.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kamisaraki",p1);    //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Waliki",p2);        //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Jakisiñkama",p3);   //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Jakisiñkama",p4);   //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Jisa",p5);         //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Jani",p6);         //Saludandonos || 5 || No
            j=1;
          }
          //////////////////////////////////////////
          activity = 2;
          break;
        case 1:    //Submenú Aymara || Conociéndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[0]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[0]+str(i+6)+".png");
            }
            p1.setMediaFile("a11.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("a12.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("vacio.mp3"); p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("a15.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("a16.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("a17.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("a18.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("a19.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("a20.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kunasa sutima?",p1);        //Conociéndonos || 6 || ¿Cuál es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Nayana sutijaxa ___",p2);   //Conociéndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Qhawqha maranitasa?",p3);   //Conociéndonos || 8 || ¿Cuántos años tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Nayaxa ___ maranithwa",p3); //Conociéndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kawkithatasa?",p4);         //Conociéndonos || 10 || ¿De dónde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"nayaxa ___ thathwa",p5);    //Conociéndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kawkinsa utjta?",p6);       //Conociéndonos || 12 || ¿Dónde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"nayaxa ___ na utjtha",p7);  //Conociéndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kawkirusa saraskta?",p8);   //Conociéndonos || 14 || ¿A dónde estás yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"___ru sarasktha",p9);       //Conociéndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 5;
          break;
        case 2:    //Submenú Aymara || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[0]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[0]+str(i+16)+".png");
            }
            p1.setMediaFile("a21.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("vacio.mp3"); p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("a23.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("a24.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("a26.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("a27.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("a28.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Naya warurt’tha",p1);      //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Naya warurt’awtha",p2);    //Estamos viviendo || 17 || To canté
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Naya warurt’äja",p3);      //Estamos viviendo || 18 || Yo cantaré
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Juma warurt’ta",p4);       //Estamos viviendo || 19 || Tú cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Juma warurt’awta",p2);     //Estamos viviendo || 20 || Tú cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Juma warurt’äta",p5);      //Estamos viviendo || 21 || Tú cantarás
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jupa warurt’i",p6);        //Estamos viviendo || 22 || Él canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jupa warurt’awi",p7);      //Estamos viviendo || 23 || Él cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jupa  warurt’äni",p2);     //Estamos viviendo || 24 || Él cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jupa warurt’i",p6);        //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jupa warurt’awi",p7);      //Estamos viviendo || 26 || Ella cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jupa warurt’ani",p2);      //Estamos viviendo || 27 || Ella cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jiwasa warurt’tana",p2);   //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jiwasa warurt’awtana",p2); //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jiwasa warurt’añani",p2);  //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jumanaka warurt’apxta",p2);//Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jumanaka warurt’awapxta",p2);//Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jumanaka warurt’awapxata",p2);//Estamos viviendo || 33 || Ustedes cantarán
            j=1;
          }
          //////////////////////////////////////////
          activity = 10;
          break;
        case 3:    //Submenú Aymara || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              jaqaru_base[i]=loadImage("MT"+"_base"+str(i)+".png"); // mt : Madre Tierra 
            }
            p1.setMediaFile("a31.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("a32.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("a33.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("a34.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("a35.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("a36.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("a37.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("a38.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("a39.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("a40.mp3"); p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Quqa",p1);      //Madre tierra || 34 || Árbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Jawira",p2);    //Madre tierra || 35 || Río 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Qinaya",p3);    //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Jallu",p4);     //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Uta",p5);       //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_base[i++],false,"Manq’a",p6);    //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_base[i++],false,"Inti/lupi/willka",p7);  //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_base[i++],false,"Phaxsi",p8);    //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_base[i++],false,"Warawara",p9);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_base[i++],false,"Nina",p10);     //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 31;
          break;
        case 4:    //Submenú Aymara || Animales
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<5;i++){
              jaqaru_base[i]=loadImage(lenguas[0]+str(i+50)+".png");
            }
            p1.setMediaFile("a45.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("a46.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("a47.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("a48.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("a49.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Juku",p1);        //Animales || Búho
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Liqiliqi",p2);    //Animales || Liqiliqi 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Waq'ana",p3);     //Animales || Pájaro bobo
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Añuthaya",p4);    //Animales || Zorrino
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Qamaqi",p5);      //Animales || Zorro
            j=1;
          }
          //////////////////////////////////////////
          activity = 36;
          break;
        case 5:    //Submenú Aymara || Abecedario
          activity = 39;
          break;
        case 6:    //Submenú Jaqaru || Saludándonos
          ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[1]+str(i)+".png");
            }
            p1.setMediaFile("j01.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("j02.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("j03.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("j04.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("j05.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("j06.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
              
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Amruchatxi?",p1);    //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Amruchawa",p2);       //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Maqktkaswa",p3);      //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Amruch maqmata",p4);  //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Jawilli",p5);        //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Ishawa",p6);         //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 41;
          break;
        case 7:    //Submenú Jaqaru || Conociéndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+6)+".png");
            }
            p1.setMediaFile("j11.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("j12.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("j13.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("j14.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("vacio.mp3"); p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("j17.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("j18.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("j19.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("j20.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Quwas shutxim?",p1);      //Conociéndonos || 6 || ¿Cuál es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Shutxinhq ___ wa",p2);     //Conociéndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Ayk watawtasa?",p3);      //Conociéndonos || 8 || ¿Cuántos años tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naq ___ watawt’wa",p4);    //Conociéndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Qawit’  jaqiwtasa?",p5);  //Conociéndonos || 10 || ¿De dónde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naq ___t’ jaqiwt’wa",p5);  //Conociéndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Qawinas jakkta?",p6);     //Conociéndonos || 12 || ¿Dónde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naq ___nw jakkt’a",p7);    //Conociéndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Qawas makta?",p8);        //Conociéndonos || 14 || ¿A dónde estás yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naq ___w makt’a",p9);      //Conociéndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 44;
          break;
        case 8:    //Submenú Jaqaru || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+16)+".png");
            }
            p1.setMediaFile("vacio.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Na kantkt’a",p1);       //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Na kantawt’a",p1);      //Estamos viviendo || 17 || To canté
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Na kantanha",p1);       //Estamos viviendo || 18 || Yo cantaré
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Juma Kantkta",p1);      //Estamos viviendo || 19 || Tú cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Juma kantawta",p1);     //Estamos viviendo || 20 || Tú cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Juma kantmata",p1);     //Estamos viviendo || 21 || Tú cantarás
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Upa kantki",p1);        //Estamos viviendo || 22 || Él canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Upa kantawi",p1);       //Estamos viviendo || 23 || Él cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Upa kantani",p1);       //Estamos viviendo || 24 || Él cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jiwsa kantktna",p1);    //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jiwsa kantawtna",p1);   //Estamos viviendo || 26 || Ella cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jiwsa kantatna",p1);    //Estamos viviendo || 27 || Ella cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jumkuna kantkta",p1);   //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jumkuna kantawta",p1);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jumkuna kantmata",p1);  //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Upkuna kantki",p1);     //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Upkuna kantawi",p1);    //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Upkuna kantani",p1);    //Estamos viviendo || 33 || Ustedes cantarán
            j=1;
          }
          //////////////////////////////////////////
          activity = 49;
          break;
        case 9:    //Submenú Jaqaru || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              jaqaru_base[i]=loadImage("MT"+"_base"+str(i)+".png"); // mt : Madre Tierra 
            }
            p1.setMediaFile("j31.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("j32.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("j33.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("j34.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("j35.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("j36.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("j37.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("j38.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("j39.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("vacio.mp3");p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Ajtz’ munti",p1);  //Madre tierra || 34 || Árbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Mayu",p2);         //Madre tierra || 35 || Río 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Urpi",p3);         //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Jallu",p4);        //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Uta",p5);          //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_base[i++],false,"Putaka",p6);       //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_base[i++],false,"Inti",p7);         //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_base[i++],false,"Pajshi",p8);       //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_base[i++],false,"Waraja",p9);       //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_base[i++],false,"Nina",p10);        //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 70;
          break;
        case 10:   //Submenú Jaqaru || Animales
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<5;i++){
              jaqaru_base[i]=loadImage(lenguas[1]+str(i+50)+".png");
            }
            p1.setMediaFile("j45.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("j46.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("j47.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("j48.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("j49.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Tuku",p1);         //Animales || Búho
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Kuntiri",p2);      //Animales || Cóndor 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Qaquchu",p3);      //Animales || Loro
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Jamp'acxa",p4);    //Animales || Sapo
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Cxuqaya",p5);      //Animales || Zorzal
            j=1;
          }
          //////////////////////////////////////////
          activity = 75;
          break;
        case 11:   //Submenú Jaqaru || Abecedario
          activity = 78;
          break;
        case 12:   //Submenú Quechua || Saludándonos
          ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[2]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[2]+str(i)+".png");
            }
            p1.setMediaFile("q01.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("q02.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("vacio.mp3"); p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("q04.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("q05.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("q06.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Allillanchu/imaynalla",p1);        //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Allillanmi/sumaqlla",p2);          //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kutimunaykama/huk kutinkama",p3);  //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Tupananchikkama/tupasunña",p4);    //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Arí",p5);                         //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Manam",p6);                       //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 80;
          break;
        case 13:   //Submenú Quechua || Conociéndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[2]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[2]+str(i+6)+".png");
            }
            p1.setMediaFile("q07.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("q08.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("q09.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("q10.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("q11.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("q12.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("q13.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("q14.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("q15.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("q16.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Iman sutiyki?",p1);               //Conociéndonos || 6 || ¿Cuál es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"sutiyqa ___",p2);                  //Conociéndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Hayk’a watayuqmi kachkanki?",p3); //Conociéndonos || 8 || ¿Cuántos años tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"___ watayuq",p4);                  //Conociéndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Maymanta kanki?",p5);             //Conociéndonos || 10 || ¿De dónde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"___manta kani",p6);                //Conociéndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Maypi Tiyanki?",p7);              //Conociéndonos || 12 || ¿Dónde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"___pi tiyani",p8);                 //Conociéndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Mayta richkanki?",p9);            //Conociéndonos || 14 || ¿A dónde estás yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"___man richkani",p10);              //Conociéndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 83;
          break;
        case 14:   //Submenú Quechua || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[2]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[2]+str(i+16)+".png");
            }
            p1.setMediaFile("vacio.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Ñuqam takichkani/takini",p1); //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Ñuqam takimurqani",p1);       //Estamos viviendo || 17 || To canté
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Qam takimusaq",p1);           //Estamos viviendo || 18 || Yo cantaré
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Qam takichkanki",p1);         //Estamos viviendo || 19 || Tú cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Qam takirqanki",p1);          //Estamos viviendo || 20 || Tú cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Qam takinki",p1);             //Estamos viviendo || 21 || Tú cantarás
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Pay takichkan/takin",p1);     //Estamos viviendo || 22 || Él canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Pay takirqam",p1);            //Estamos viviendo || 23 || Él cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Pay takinqa",p1);             //Estamos viviendo || 24 || Él cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Pay takichkan/takin",p1);     //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Pay takirqam",p1);            //Estamos viviendo || 26 || Ella cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Pay takinqa",p1);             //Estamos viviendo || 27 || Ella cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Ñuqanchik takinchik",p1);     //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Ñuqanchik takirqanchik",p1);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Ñuqanchik takisunchik",p1);   //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Qamkuna takichkankichik",p1); //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Qamkuna takirqankichik",p1);  //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Qamkuna takinkichik",p1);     //Estamos viviendo || 33 || Ustedes cantarán
            j=1;
          }
          //////////////////////////////////////////
          activity = 88;
          break;
        case 15:   //Submenú Quechua || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              jaqaru_base[i]=loadImage("MT"+"_base"+str(i)+".png"); // mt : Madre Tierra 
            }
            p1.setMediaFile("q35.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("q36.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("q37.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("q38.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("q39.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("q40.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("q41.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("q42.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("q43.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("q44.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Mallki",p1);   //Madre tierra || 34 || Árbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Mayu",p2);     //Madre tierra || 35 || Río 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Phuyu",p3);    //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Para",p4);     //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Wasi",p5);     //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_base[i++],false,"Mikhuna",p6);  //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_base[i++],false,"Inti",p7);     //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_base[i++],false,"Killa",p8);    //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_base[i++],false,"Ch’aska",p9);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_base[i++],false,"Nina",p10);    //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 109;
          break;
        case 16:   //Submenú Quechua || Animales
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<5;i++){
              jaqaru_base[i]=loadImage(lenguas[2]+str(i+50)+".png");
            }
            p1.setMediaFile("q45.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("q46.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("q47.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("q48.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("q49.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Huku",p1);         //Animales || Búho
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"K'illichu",p2);    //Animales || Cernícalo 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Kuntu",p3);        //Animales || Cóndor
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Chiwaku",p4);      //Animales || Tordo
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Añas",p5);         //Animales || Zorrino
            j=1;
          }
          //////////////////////////////////////////
          activity = 114;
          break;
        case 17:   //Submenú Quechua || Abecedario
          activity = 117;
          break;
        case 18:   //Submenú Shipibo || Saludándonos
        ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[3]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[3]+str(i)+".png");
            }
            p1.setMediaFile("s01.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("s02.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("sacio.mp3"); p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("s04.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("s05.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("s06.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Ointa/Jowe",p1);              //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Jaweskarin/Ointa chan",p2);   //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kabanon",p3);                 //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Jeje(hombre)/jojo(mujer)",p4);//Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Jaskara",p5);                //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Jaskarama",p6);              //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 119;
          break;
        case 19:   //Submenú Shipibo || Conociéndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[3]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[3]+str(i+6)+".png");
            }
            p1.setMediaFile("s07.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("s08.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("s09.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("s10.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("s11.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("s12.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("s13.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("s14.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("s15.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("s16.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Jawe janerin mia?",p1);          //Conociéndonos || 6 || ¿Cuál es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Nokon janeriki ___",p2);          //Conociéndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Jaweti baritianri mia?",p3);     //Conociéndonos || 8 || ¿Cuántos años tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Eariki ___ baritia",p4);          //Conociéndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Jawerato jemankoniarin mia?",p5);//Conociéndonos || 10 || ¿De dónde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Eariki ___",p6);                  //Conociéndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Jawerano jaarin mia?",p7);       //Conociéndonos || 12 || ¿Dónde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Eara jake ___",p8);               //Conociéndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Jawerano kairin mia?",p9);       //Conociéndonos || 14 || ¿A dónde estás yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Eara kai ___",p10);               //Conociéndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 122;
          break;
        case 20:   //Submenú Shipibo || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[3]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[3]+str(i+16)+".png");
            }
            p1.setMediaFile("s17.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("s18.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("s19.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("s20.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("s21.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("s22.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("s23.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("s24.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("s25.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("s26.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            p11.setMediaFile("s27.mp3");  p11.setLooping(false);  p11.setVolume(1.0, 1.0);
            p12.setMediaFile("s28.mp3");  p12.setLooping(false);  p12.setVolume(1.0, 1.0);
            p13.setMediaFile("s29.mp3");  p13.setLooping(false);  p13.setVolume(1.0, 1.0);
            p14.setMediaFile("s30.mp3");  p14.setLooping(false);  p14.setVolume(1.0, 1.0);
            p15.setMediaFile("s31.mp3");  p15.setLooping(false);  p15.setVolume(1.0, 1.0);
            p16.setMediaFile("s32.mp3");  p16.setLooping(false);  p16.setVolume(1.0, 1.0);
            p17.setMediaFile("s33.mp3");  p17.setLooping(false);  p17.setVolume(1.0, 1.0);
            p18.setMediaFile("s34.mp3");  p18.setLooping(false);  p18.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Eara bewai",p1);          //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Eara bewake",p2);         //Estamos viviendo || 17 || To canté
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Eara bewai kai",p3);      //Estamos viviendo || 18 || Yo cantaré
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Miara bewai",p4);         //Estamos viviendo || 19 || Tú cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Miara bewake",p5);        //Estamos viviendo || 20 || Tú cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Miara bewai kai",p6);     //Estamos viviendo || 21 || Tú cantarás
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Oara bewai",p7);          //Estamos viviendo || 22 || Él canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Oara bewake",p8);         //Estamos viviendo || 23 || Él cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Oara bewai kai",p9);      //Estamos viviendo || 24 || Él cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Oa ainbora bewai",p10);    //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Oa ainbora bewake",p11);   //Estamos viviendo || 26 || Ella cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Oa ainbora bewai kai",p12);//Estamos viviendo || 27 || Ella cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Noabora bewai",p13);       //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Noabora bewake",p14);      //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Noabora bewai kai",p15);   //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Matora bewai",p16);        //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Matora bewake",p17);       //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Matora bewai kai",p18);    //Estamos viviendo || 33 || Ustedes cantarán
            j=1;
          }
          //////////////////////////////////////////
          activity = 127;
          break;
        case 21:   //Submenú Shipibo || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              jaqaru_base[i]=loadImage("MT"+"_base"+str(i)+".png"); // mt : Madre Tierra 
            }
            p1.setMediaFile("s35.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("s36.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("s37.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("s38.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("s39.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("s40.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("s41.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("s42.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("s43.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("s44.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Jiwi niibo",p1);//Madre tierra || 34 || Árbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Paro",p2);      //Madre tierra || 35 || Río 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Nai koin",p3);  //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Oi",p4);        //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Xobo",p5);      //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_base[i++],false,"Piti",p6);      //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_base[i++],false,"Bari",p7);      //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_base[i++],false,"Oxe",p8);       //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_base[i++],false,"Wishtinbo",p9); //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_base[i++],false,"Chií tiri",p10); //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 148;
          break;
        case 22:   //Submenú Shipibo || Animales
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<5;i++){
              jaqaru_base[i]=loadImage(lenguas[3]+str(i+50)+".png");
            }
            p1.setMediaFile("s45.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("s46.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("s47.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("s48.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("s49.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Misho",p1);      //Animales || Gato
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Nonon",p2);      //Animales || Pato 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Pitso",p3);      //Animales || Perico
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Ochite",p4);     //Animales || Perro
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Shipi",p5);      //Animales || Pichico
            j=1;
          }
          //////////////////////////////////////////
          activity = 153;
          break;
        case 23:   //Submenú Shipibo || Abecedario
          activity = 156;
          break;
        case 24:   //Submenú Matsiguenka || Saludándonos
          ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[4]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[4]+str(i)+".png");
            }
            p1.setMediaFile("m01.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("m02.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("m03.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("m04.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("m05.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("m06.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Ogá/Oga aiñovi",p1);     //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Je’je/neje aiñona",p2);  //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Atana/noatavaeta",p3);   //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Nani",p4);               //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Jeje",p5);              //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Tera/Gara",p6);         //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 158;
          break;
        case 25:   //Submenú Matsiguenka || Conociéndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[4]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[4]+str(i+6)+".png");
            }
            p1.setMediaFile("m07.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("m08.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("m09.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("m10.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("m11.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("m12.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("m13.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("m14.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("m15.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("m16.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Trara pipaita?",p1);                         //Conociéndonos || 6 || ¿Cuál es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naro novairo onti ___",p2);                   //Conociéndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Akati pishiriagakotanaka?",p3);              //Conociéndonos || 8 || ¿Cuántos años tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naro noshiriagakotanaka ___ shiriagarini",p4);//Conociéndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Tyara piponiaka?",p5);                       //Conociéndonos || 10 || ¿De dónde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naro noponiaka ___",p6);                      //Conociéndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Tyara pitimi?",p7);                          //Conociéndonos || 12 || ¿Dónde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naro notimi ___",p8);                         //Conociéndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Tyara piatanake?",p9);                       //Conociéndonos || 14 || ¿A dónde estás yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Noatanake anta ___",p10);                     //Conociéndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 161;
          break;
        case 26:   //Submenú Matsiguenka || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[4]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[4]+str(i+16)+".png");
            }
            p1.setMediaFile("m17.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("m18.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("m19.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("m20.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("m21.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("m22.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("m23.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("m24.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("m25.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("m26.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            p11.setMediaFile("m27.mp3");  p11.setLooping(false);  p11.setVolume(1.0, 1.0);
            p12.setMediaFile("m28.mp3");  p12.setLooping(false);  p12.setVolume(1.0, 1.0);
            p13.setMediaFile("m29.mp3");  p13.setLooping(false);  p13.setVolume(1.0, 1.0);
            p14.setMediaFile("m30.mp3");  p14.setLooping(false);  p14.setVolume(1.0, 1.0);
            p15.setMediaFile("m31.mp3");  p15.setLooping(false);  p15.setVolume(1.0, 1.0);
            p16.setMediaFile("m32.mp3");  p16.setLooping(false);  p16.setVolume(1.0, 1.0);
            p17.setMediaFile("m33.mp3");  p17.setLooping(false);  p17.setVolume(1.0, 1.0);
            p18.setMediaFile("m34.mp3");  p18.setLooping(false);  p18.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Naro nomatikake",p1);             //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Naro nomatikakiti",p2);           //Estamos viviendo || 17 || To canté
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Naro nomatikakerookari",p3);      //Estamos viviendo || 18 || Yo cantaré
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Viro pimatikake",p4);             //Estamos viviendo || 19 || Tú cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Viro pimatikakiti",p5);           //Estamos viviendo || 20 || Tú cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Viro pimatikakerookari",p6);      //Estamos viviendo || 21 || Tú cantarás
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Iriro imatikake",p7);             //Estamos viviendo || 22 || Él canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Iriro imatikakiti",p8);           //Estamos viviendo || 23 || Él cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Iriro imatikakerookari",p9);      //Estamos viviendo || 24 || Él cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Irorori omatikake",p10);           //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Irorori omatikakiti",p11);         //Estamos viviendo || 26 || Ella cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Irorori omatikakerookari",p12);    //Estamos viviendo || 27 || Ella cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Naroegi nomatikaigake",p13);       //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Naroegi nomatikaigakiti",p14);     //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Naroegi nomatikaigakerookari",p15);//Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Viroegi pimatikaigake",p16);       //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Viroegi pimatikaigakiti",p17);     //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Viroegi pimatikaigakerookari",p18);//Estamos viviendo || 33 || Ustedes cantarán
            j=1;
          }
          //////////////////////////////////////////
          activity = 166;
          break;
        case 27:   //Submenú Matsiguenka || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              jaqaru_base[i]=loadImage("MT"+"_base"+str(i)+".png"); // mt : Madre Tierra 
            }
            p1.setMediaFile("m35.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("m36.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("m37.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("m38.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("m39.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("m40.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("m41.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("m42.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("m43.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("m44.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Inchato/inkenishi",p1);    //Madre tierra || 34 || Árbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Eni",p2);                  //Madre tierra || 35 || Río 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Menkori",p3);              //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Inkani",p4);               //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Pankotsi",p5);             //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_base[i++],false,"Sekatsi",p6);              //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_base[i++],false,"Poreatsiri",p7);           //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_base[i++],false,"Kashiri",p8);              //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_base[i++],false,"Impokiro/impokiropage",p9);//Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_base[i++],false,"Morekari",p10);             //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 187;
          break;
        case 28:   //Submenú Matsiguenka || Animales
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<5;i++){
              jaqaru_base[i]=loadImage(lenguas[4]+str(i+50)+".png");
            }
            p1.setMediaFile("m45.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("vacio.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("m47.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("vacio.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("m49.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Tontokoti",p1);      //Animales || Búho
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"",p2);               //Animales || Vacio 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Maeni",p3);          //Animales || Oso
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"",p4);               //Animales || Vacio
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Matsontsori",p5);    //Animales || Tigre
            j=1;
          }
          //////////////////////////////////////////
          activity = 192;
          break;
        case 29:   //Submenú Matsiguenka || Abecedario
          activity = 195;
          break;
        case 30:   //Submenú Yine || Saludándonos
          ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[5]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[5]+str(i)+".png");
            }
            p1.setMediaFile("y01.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("y02.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("y03.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("y04.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("y05.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("y06.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Galu/wiwi",p1); //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Galu",p2);      //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Nyatka",p3);    //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Gowu",p4);      //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Gigi",p5);     //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Gike",p6);     //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 197;
          break;
        case 31:   //Submenú Yine || Conociéndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[5]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[5]+str(i+6)+".png");
            }
            p1.setMediaFile("y07.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("y08.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("y09.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("y10.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("y11.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("y12.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("y13.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("y14.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("y15.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("y16.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Klu giwakyi?",p1);            //Conociéndonos || 6 || ¿Cuál es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Ngiwakni ___",p2);             //Conociéndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Gipejnu walapu wanenyi?",p3); //Conociéndonos || 8 || ¿Cuántos años tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Pamyomole walapu wanenyno",p4);//Conociéndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Ginakgajeryi?",p5);           //Conociéndonos || 10 || ¿De dónde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Miariya gajerno gita",p6);     //Conociéndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Ginaka pwa?",p7);             //Conociéndonos || 12 || ¿Dónde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Gawaka sreta wa gita",p8);     //Conociéndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"¿Ginaka pyamta?",p9);          //Conociéndonos || 14 || ¿A dónde estás yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Jiryegi nyamta",p10);          //Conociéndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 200;
          break;
        case 32:   //Submenú Yine || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[5]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[5]+str(i+16)+".png");
            }
            p1.setMediaFile("y17.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("y18.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("y19.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("y20.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("y21.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("y22.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("y23.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("y24.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("y25.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("y26.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            p11.setMediaFile("y27.mp3");  p11.setLooping(false);  p11.setVolume(1.0, 1.0);
            p12.setMediaFile("y28.mp3");  p12.setLooping(false);  p12.setVolume(1.0, 1.0);
            p13.setMediaFile("y29.mp3");  p13.setLooping(false);  p13.setVolume(1.0, 1.0);
            p14.setMediaFile("y30.mp3");  p14.setLooping(false);  p14.setVolume(1.0, 1.0);
            p15.setMediaFile("y31.mp3");  p15.setLooping(false);  p15.setVolume(1.0, 1.0);
            p16.setMediaFile("y32.mp3");  p16.setLooping(false);  p16.setVolume(1.0, 1.0);
            p17.setMediaFile("y33.mp3");  p17.setLooping(false);  p17.setVolume(1.0, 1.0);
            p18.setMediaFile("y34.mp3");  p18.setLooping(false);  p18.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Nshikalewata",p1);        //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Nshikalwanata",p2);       //Estamos viviendo || 17 || To canté
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Nshikalwatanu",p3);       //Estamos viviendo || 18 || Yo cantaré
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Pshikalwatanu",p4);       //Estamos viviendo || 19 || Tú cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Pshikalewanata",p5);      //Estamos viviendo || 20 || Tú cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Pshikalewatanu",p6);      //Estamos viviendo || 21 || Tú cantarás
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Wale shikalwata",p7);     //Estamos viviendo || 22 || Él canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Wale shikalewatatka",p8); //Estamos viviendo || 23 || Él cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Wale shikalewatanu",p9);  //Estamos viviendo || 24 || Él cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Wala shikalwata",p10);    //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Wala shikalewanata",p11); //Estamos viviendo || 26 || Ella cantó
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Wala shikalewatanu",p12); //Estamos viviendo || 27 || Ella cantará
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Wixa shikalwata",p13);    //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Wixa shikalwanata",p14);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Wixa shikalewatanu",p15); //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Gixa shikalewata",p16);   //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Gixa shikalewanata",p17); //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Gixa shikalewatanu",p18); //Estamos viviendo || 33 || Ustedes cantarán
            j=1;
          }
          //////////////////////////////////////////
          activity = 205;
          break;
        case 33:   //Submenú Yine || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              jaqaru_base[i]=loadImage("MT"+"_base"+str(i)+".png"); // mt : Madre Tierra 
            }
            p1.setMediaFile("y35.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("y36.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("y37.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("y38.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("y39.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            p6.setMediaFile("y40.mp3");   p6.setLooping(false);   p6.setVolume(1.0, 1.0);
            p7.setMediaFile("y41.mp3");   p7.setLooping(false);   p7.setVolume(1.0, 1.0);
            p8.setMediaFile("y42.mp3");   p8.setLooping(false);   p8.setVolume(1.0, 1.0);
            p9.setMediaFile("y43.mp3");   p9.setLooping(false);   p9.setVolume(1.0, 1.0);
            p10.setMediaFile("y44.mp3");  p10.setLooping(false);  p10.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Kashegiru",p1); //Madre tierra || 34 || Árbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Tsruru",p2);    //Madre tierra || 35 || Río 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Kamkolu",p3);   //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Gina",p4);      //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Panchi",p5);    //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_base[i++],false,"Niikaluru",p6); //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_base[i++],false,"Tkachi",p7);    //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_base[i++],false,"Ksuru",p8);     //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_base[i++],false,"Katagiri",p9);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_base[i++],false,"Katalu",p10);    //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 226;
          break;
        case 34:   //Submenú Yine || Animales
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<5;i++){
              jaqaru_base[i]=loadImage(lenguas[5]+str(i+50)+".png");
            }
            p1.setMediaFile("y45.mp3");   p1.setLooping(false);   p1.setVolume(1.0, 1.0);
            p2.setMediaFile("y46.mp3");   p2.setLooping(false);   p2.setVolume(1.0, 1.0);
            p3.setMediaFile("y47.mp3");   p3.setLooping(false);   p3.setVolume(1.0, 1.0);
            p4.setMediaFile("y48.mp3");   p4.setLooping(false);   p4.setVolume(1.0, 1.0);
            p5.setMediaFile("y49.mp3");   p5.setLooping(false);   p5.setVolume(1.0, 1.0);
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_base[i++],false,"Pejru",p1);      //Animales || Añuje
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_base[i++],false,"Chikga",p2);     //Animales || Chicua 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_base[i++],false,"Giyeka",p3);     //Animales || Paujil
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_base[i++],false,"Mgenoklu",p4);   //Animales || Tigre
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_base[i++],false,"Gogru",p5);      //Animales || Unchala
            j=1;
          }
          //////////////////////////////////////////
          activity = 231;
          break;
        case 35:   //Submenú Yine || Abecedario
          activity = 234;
          break;
      }
    }
  }
 
  void display() {
    switch(ID%6){
      case 0:
        fill(104,159,56);
        break;
      case 1:
        fill(237,59,59);
        break;
      case 2:
        fill(3,155,229);
        break;
      case 3:
        fill(83,109,254);
        break;
      case 4:
        fill(153,51,102);
        break;
      case 5:
        fill(255,204,0);
        break;
    }
    noStroke();
    rect(x,y,w,h,7);
    fill(TXT);
    textFont(fontMenu);
    //textFont(fontsubMenu);
    textSize(altoGlobal/16);
    text(SUBMENU, int(x+min_x*1.5), int(y+min_y));
    textSize(altoGlobal/28);
    text(submenu, int(x+min_x*1.5), int(y+min_y*1.5));
  }
  
  void over(){
    if( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }
 
}
