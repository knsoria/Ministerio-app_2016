/*
lengua0=aymara
lengua1=jaqaru
lengua2=quechua
lengua3=shipibo
lengua4=matshiguenka
lengua5=yine
*/
import apwidgets.*; //libreria audio
APMediaPlayer p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18;

int j;
PFont fontMenu,fontsubMenu,fontsubmenu,fontcancion;
PImage imagenMin;
PImage imagenIntro;
PImage base_fondo;
PImage cielo_fondo;
PImage imagenRight;
PImage imagenLeft;

String[] lenguas = {"Aymara","Jaqaru","Quechua","Shipibo","Matsigenka","Yine"}; 

boolean intro = true;

float anchoGlobal;
float altoGlobal;
float ALFA;
float beta;

int n=6, m=34;
int activity = 0, last_activity = 0;
boolean bloqueado = false;

PImage[] file = new PImage[n];

PImage[] jaqaru_file = new PImage[m];  //Jaqaru
PImage[] jaqaru_base = new PImage[10];


ImageButtons[] menuButtons = new ImageButtons[n+4];
ImageButtons[] contenidoButtons = new ImageButtons[m*6];

SqButtons[] submenuButtons = new SqButtons[36];
String[] submenu = {"Saludándonos","Conociéndonos","Estamos viviendo","Madre tierra","Animales","Cantemos"}; 
String[][] SUBMENU = {{"Aruntasipxañani","Uñt’asipxañani","Jakasisipxktanwa","Pachamama","Uywanaka","Warurt’apxañani"},
                      {"Amruchatxi sashtna","Illt’ishitna","Jakasw jakktna","Uriqmama","Uywkuna","Katt’atna"},
                      {"Napayukuspanchik","Riqsinakuspa","Kawsachkanchik","Pachamama","Uywakuna","Takisun"},
                      {"Jowe Ianananti","Onanananti","Noara japariax itai","Mai tita","Yoinabo","Bewanon ikanwe"},
                      {"Niavakagantsi","Neavakagantsi","Timagantsi","Onato kipatsi","Inkenishipagekunirira","Matikaigakera"},
                      {"Walukakanu","Wumatkakanu","Estamos viviendo","Madre tierra","Animales","Wsikalwatanu"}};

void setup(){
  size(displayWidth,displayHeight);
  anchoGlobal = displayWidth;
  altoGlobal = displayHeight;
  
  p1 = new APMediaPlayer(this);
  p2 = new APMediaPlayer(this);
  p3 = new APMediaPlayer(this);
  p4 = new APMediaPlayer(this);
  p5 = new APMediaPlayer(this);
  p6 = new APMediaPlayer(this);
  p7 = new APMediaPlayer(this);
  p8 = new APMediaPlayer(this);
  p9 = new APMediaPlayer(this);
  p10 = new APMediaPlayer(this);
  p11 = new APMediaPlayer(this);
  p12 = new APMediaPlayer(this);
  p13 = new APMediaPlayer(this);
  p14 = new APMediaPlayer(this);
  p15 = new APMediaPlayer(this);
  p16 = new APMediaPlayer(this);
  p17 = new APMediaPlayer(this);
  p18 = new APMediaPlayer(this);    

  imagenMin=loadImage("logo.jpg");
  imagenIntro=loadImage("nombre1.png");
  base_fondo=loadImage("mosaico.png");
  cielo_fondo=loadImage("cielo.png");
  orientation(LANDSCAPE);
  
  for(int i=0;i<file.length;i++){
    file[i]=loadImage("lengua"+str(i)+".png");
  }
  ALFA = anchoGlobal/(8*file[0].width);  //file[0].width & file[0].height standar
  float ALFA_width = ALFA*file[0].width;
  float ALFA_height = ALFA*file[0].height;
  float ALFA_base_fondo = (base_fondo.width*ALFA);
  
  for(int i=0;i<file.length;i++){
    menuButtons[i] = new ImageButtons(i,0,int((1+i)*anchoGlobal/8),int(altoGlobal-0.9*(ALFA_base_fondo)-(ALFA_height)),int(ALFA_width),int(ALFA_height),file[i],file[i]); 
  }
  
  for(int i=0;i<SUBMENU.length;i++){
    for(int j=0;j<SUBMENU[0].length;j++){
      int k = (6*i)+j;
      submenuButtons[k] = new SqButtons(k,SUBMENU[i][j],submenu[j],int(anchoGlobal/9),int(altoGlobal/13));
    }
  }
  
  imagenRight=loadImage("right.png");
  beta = imagenRight.height/altoGlobal;
  menuButtons[7] = new ImageButtons(7,1,int(anchoGlobal-(imagenRight.width/beta))+1,0,int(imagenRight.width/beta),int(altoGlobal),imagenRight,imagenRight);  //Adelantar
  imagenLeft=loadImage("left.png");
  menuButtons[6] = new ImageButtons(6,2,0,0,int(imagenRight.width/beta),int(altoGlobal),imagenLeft,imagenLeft);   //Retrasar
  menuButtons[8] = new ImageButtons(8,2,0,0,int(imagenRight.width/beta),int(altoGlobal),imagenLeft,imagenLeft);   //Retrasar al submenu
  menuButtons[9] = new ImageButtons(9,2,0,0,int(imagenRight.width/beta),int(altoGlobal),imagenLeft,imagenLeft);   //Retrasar al menu principal

  fontMenu = loadFont("Haettenschweiler-48.vlw");
  fontsubMenu = loadFont("CourierNew36.vlw");
  fontsubmenu = loadFont("Haettenschweiler-100.vlw");
  fontcancion = loadFont("ComicSansMS-36.vlw");
  //agregar otro 

  //sonido
  //saludandonosa();
}

void draw(){
  switch(activity){
    case 0:    // Menú principial ||Jaqaru Aymara Matsiguenka Quechua Shipibo Yine
        //Función de entrada
        if (intro) {
            if(millis()<3000){
              background(255);
              imageMode(CENTER);
              image(imagenMin,anchoGlobal/2,altoGlobal/2,imagenMin.width*altoGlobal/1200,imagenMin.height*altoGlobal/1200);
              imageMode(CORNER);
            }
            else if(millis()<5500){
                background(#F20000);
                imageMode(CENTER);
                image(imagenIntro,anchoGlobal/2,altoGlobal/2,imagenIntro.width*anchoGlobal/1000,imagenIntro.height*anchoGlobal/1000);
                imageMode(CORNER);
                j=0;
                if(j==0){
                  imagenMin=loadImage("Lema.png"); //Lema0 Negro || Lema Blanco
                  j=1;
                }
            }
            else { intro = false; }
        }
        //Función display
        else{
          background(69,90,140);
          imageMode(CORNER);
          float omega = (altoGlobal-(0.9*base_fondo.height*ALFA))/cielo_fondo.height;
          for(int i=0;cielo_fondo.width*i<=anchoGlobal;i++){
            image(cielo_fondo,cielo_fondo.width*i,0,cielo_fondo.width,cielo_fondo.height*omega);
          }
          for(int i=0;base_fondo.width*ALFA*i<=anchoGlobal;i++){
            image(base_fondo,base_fondo.width*ALFA*i,altoGlobal-(base_fondo.height*ALFA),base_fondo.width*ALFA,base_fondo.height*ALFA);
          }
          imageMode(CENTER);
          float tau = (0.9*anchoGlobal)/imagenMin.width;
          image(imagenMin,anchoGlobal/2,altoGlobal/4,imagenMin.width*tau,imagenMin.height*tau);
          imageMode(CORNER);
          for(int i=0;i<6;i++){
            menuButtons[i].update();
            menuButtons[i].display();
          }
          float ALFA_base_fondo = (base_fondo.width*ALFA);
          float theta[] = {0.85,0.85,0.9,0.8,1.1,0.6};
          //fill(50,200);
          rectMode(CENTER);
          textAlign(CENTER, TOP);
          textFont(fontMenu,int(altoGlobal/16));
          for(int i=0;i<6;i++){
            fill(50,200);
            rect((3+2*i)*anchoGlobal/16 , altoGlobal-0.9*ALFA_base_fondo+2 , theta[i]*anchoGlobal/8 , 33, 10);
            fill(255);
            text(lenguas[i],int((3+2*i)*anchoGlobal/16),int(altoGlobal-(base_fondo.width*ALFA)));
          }
          textAlign(CENTER);
          rectMode(CORNER);
        }
      break;
    case 1:    // Submenú || Aymara
      background(238);
      textFont(fontsubmenu,int(altoGlobal/5));
      fill(98);
      text(lenguas[0],2.5*int(anchoGlobal/9),3*int(altoGlobal/13));
      for(int i=0;i<6;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 2:    // Submenú || Aymara || Saludándonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - saludo y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 3:    // Submenú || Aymara || Saludándonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - despedida y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 4:    // Submenú || Aymara || Saludándonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - afirmación y negación",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 5:    // Submenú || Aymara || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos -  ¿Cuál es tu nombre? / Mi nombre es _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 6:    // Submenú || Aymara || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Cuántos años tienes? / Yo tengo _ años",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 7:    // Submenú || Aymara || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿De dónde eres? / Yo soy de _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 8:    // Submenú || Aymara || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Dónde vives? / Yo vivo en _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 9:    // Submenú || Aymara || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿A dónde estás yendo? / Estoy yendo a _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 10:   // Submenú || Aymara || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){     //Botones para adelantar y retroceder activity
        menuButtons[i].display();
        menuButtons[i].update();
      }
      for(int i=0;i<3;i++){      //Imagenes
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 11:   // Submenú || Aymara || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo: Cantar",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].display();
        menuButtons[i].update();
      }
      for(int i=3;i<6;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 12:   // Submenú || Aymara || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].display();
        menuButtons[i].update();
      }
      for(int i=6;i<9;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 13:   // Submenú || Aymara || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].display();
        menuButtons[i].update();
      }
      for(int i=9;i<12;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 14:   // Submenú || Aymara || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].display();
        menuButtons[i].update();
      }
      for(int i=12;i<15;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 15:   // Submenú || Aymara || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();      //Limite forzado
      menuButtons[6].display();
      for(int i=15;i<18;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 16:   // Submenú || Aymara || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].display();
        menuButtons[i].update();
      }
      break;
    case 17:   // Submenú || Aymara || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 18:   // Submenú || Aymara || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 19:   // Submenú || Aymara || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 20:   // Submenú || Aymara || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 21:   // Submenú || Aymara || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 22:   // Submenú || Aymara || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 23:   // Submenú || Aymara || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 24:   // Submenú || Aymara || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 25:   // Submenú || Aymara || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 26:   // Submenú || Aymara || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 27:   // Submenú || Aymara || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 28:   // Submenú || Aymara || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 29:   // Submenú || Aymara || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 30:   // Submenú || Aymara || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 31:   // Submenú || Aymara || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 32:   // Submenú || Aymara || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 33:   // Submenú || Aymara || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 34:   // Submenú || Aymara || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 35:   // Submenú || Aymara || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 36:   // Submenú || Aymara || Animales || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 37:   // Submenú || Aymara || Animales || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 38:   // Submenú || Aymara || Animales || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      menuButtons[6].update();
      menuButtons[6].display();
      
      contenidoButtons[4].display();
      contenidoButtons[4].update();
      break;
    case 39:   // Submenú || Aymara || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Cantemos",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,int(altoGlobal/30));
      fill(153,51,102);
      text("Suni payita mantanthaya", width/2, altoGlobal/4.5);
      text("Aqarapita jiskhullani",width/2, altoGlobal/4.5 + altoGlobal/20);
      text("Suni payita mantanthaya",width/2, altoGlobal/4.5 + 2*altoGlobal/20);
      text("Chhullunkhayata jiskhullani", width/2,  altoGlobal/4.5 + 3*altoGlobal/20);
      text("Jumaru muniriwa mantanthaya",width/2, altoGlobal/4.5 + 4*altoGlobal/20);
      text("Jumaru waylluriwa saraqanthaya",width/2, altoGlobal/4.5 + 5*altoGlobal/20);
      text("Inacha munitani sasina",width/2, altoGlobal/4.5 + 6*altoGlobal/20);
      text("Inacha wayllutani sasina",width/2, altoGlobal/4.5 + 7*altoGlobal/20);
      text("Jumaru waylluriwa saraqanthaya",width/2, altoGlobal/4.5 + 8*altoGlobal/20);
      text("T’ijxarakisma kullakaya",width/2, altoGlobal/4.5 + 9*altoGlobal/20);
      text("Chhaqxaralisma kullakaya",width/2, altoGlobal/4.5 + 10*altoGlobal/20);
      
      menuButtons[8].update();
      menuButtons[8].display();
      break;
    case 40:   // Submenú || Jaqaru
      background(238);
      textFont(fontsubmenu,int(altoGlobal/5));
      fill(98);
      text(lenguas[1],2.5*int(anchoGlobal/9),3*int(altoGlobal/13));
      for(int i=6;i<12;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 41:   // Submenú || Jaqaru || Saludándonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - saludo y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 42:   // Submenú || Jaqaru || Saludándonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - despedida y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 43:   // Submenú || Jaqaru || Saludándonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - afirmación y negación",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 44:   // Submenú || Jaqaru || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos -  ¿Cuál es tu nombre? / Mi nombre es _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 45:   // Submenú || Jaqaru || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Cuántos años tienes? / Yo tengo _ años",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 46:   // Submenú || Jaqaru || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿De dónde eres? / Yo soy de _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 47:   // Submenú || Jaqaru || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Dónde vives? / Yo vivo en _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 48:   // Submenú || Jaqaru || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿A dónde estás yendo? / Estoy yendo a _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 49:   // Submenú || Jaqaru || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<3;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 50:   // Submenú || Jaqaru || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo: Cantar",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=3;i<6;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 51:   // Submenú || Jaqaru || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<9;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 52:   // Submenú || Jaqaru || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=9;i<12;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 53:   // Submenú || Jaqaru || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=12;i<15;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 54:   // Submenú || Jaqaru || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      menuButtons[6].update();      //Limite forzado
      menuButtons[6].display();
      for(int i=15;i<18;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 55:   // Submenú || Jaqaru || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 56:   // Submenú || Jaqaru || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 57:   // Submenú || Jaqaru || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 58:   // Submenú || Jaqaru || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 59:   // Submenú || Jaqaru || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 60:   // Submenú || Jaqaru || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 61:   // Submenú || Jaqaru || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 62:   // Submenú || Jaqaru || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 63:   // Submenú || Jaqaru || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 64:   // Submenú || Jaqaru || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 65:   // Submenú || Jaqaru || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 66:   // Submenú || Jaqaru || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 67:   // Submenú || Jaqaru || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 68:   // Submenú || Jaqaru || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 69:   // Submenú || Jaqaru || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 70:   // Submenú || Jaqaru || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 71:   // Submenú || Jaqaru || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 72:   // Submenú || Jaqaru || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 73:   // Submenú || Jaqaru || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 74:   // Submenú || Jaqaru || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 75:   // Submenú || Jaqaru || Animales || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 76:   // Submenú || Jaqaru || Animales || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 77:   // Submenú || Jaqaru || Animales || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      menuButtons[6].update();
      menuButtons[6].display();
      
       contenidoButtons[4].display();
       contenidoButtons[4].update();
      break;
    case 78:   // Submenú || Jaqaru || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Cantemos",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,int(altoGlobal/30));
      fill(153,51,102);
      text("T'akcham maqmata", width/2, altoGlobal/5);
      text("Ishkasw upaq akankitxi",width/2, altoGlobal/5 + altoGlobal/25);
      text("Jatzach jatzmanqa",width/2, altoGlobal/5 + 2*altoGlobal/25);
      text("¿Upaq ujtqanitxi?", width/2,  altoGlobal/5 + 3*altoGlobal/25);
      text("Matxir ch'amkipnacha",width/2, altoGlobal/5 + 4*altoGlobal/25);
      text("Kallapshpuntish imk'ktma",width/2, altoGlobal/5 + 5*altoGlobal/25);
      text("Matxir ch'amkipnacha",width/2, altoGlobal/5 + 6*altoGlobal/25);
      text("Shuqushpujyish imk'ktma",width/2, altoGlobal/5 + 7*altoGlobal/25);
      text("Mayut' umaps ch'uyshuwqiwa",width/2, altoGlobal/5 + 8*altoGlobal/25);
      text("Wasap'w upaps waski",width/2, altoGlobal/5 + 9*altoGlobal/25);
      text("Jaktacham yuyt'amata",width/2, altoGlobal/5 + 10*altoGlobal/25);
      text("T'akimw akqamata",width/2, altoGlobal/5 + 11*altoGlobal/25);
      text("Matxir ch'amkipnacha",width/2, altoGlobal/5 + 12*altoGlobal/25); 
      text("Kallapshpuntish imk'ktma",width/2, altoGlobal/5 + 13*altoGlobal/25);
      text("Matxir ch'amkipnacha",width/2, altoGlobal/5 + 14*altoGlobal/25);
      text("Shuqushpujyish imk'ktma",width/2, altoGlobal/5 + 15*altoGlobal/25);
      
      menuButtons[8].update();
      menuButtons[8].display();
      break;
    case 79:   // Submenú || Quechua
      background(238);
      textFont(fontsubmenu,int(altoGlobal/5));
      fill(98);
      text(lenguas[2],2.5*int(anchoGlobal/9),3*int(altoGlobal/13));
      for(int i=12;i<18;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 80:   // Submenú || Quechua || Saludándonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - saludo y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 81:   // Submenú || Quechua || Saludándonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - despedida y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 82:   // Submenú || Quechua || Saludándonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - afirmación y negación",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 83:   // Submenú || Quechua || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos -  ¿Cuál es tu nombre? / Mi nombre es _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 84:   // Submenú || Quechua || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Cuántos años tienes? / Yo tengo _ años",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 85:   // Submenú || Quechua || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿De dónde eres? / Yo soy de _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 86:   // Submenú || Quechua || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Dónde vives? / Yo vivo en _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 87:   // Submenú || Quechua || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿A dónde estás yendo? / Estoy yendo a _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 88:   // Submenú || Quechua || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<3;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 89:   // Submenú || Quechua || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo: Cantar",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=3;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 90:   // Submenú || Quechua || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<9;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 91:   // Submenú || Quechua || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=9;i<12;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 92:   // Submenú || Quechua || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=12;i<15;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 93:   // Submenú || Quechua || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      menuButtons[6].update();      //Limite forzado
      menuButtons[6].display();
      for(int i=15;i<18;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 94:   // Submenú || Quechua || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 95:   // Submenú || Quechua || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 96:   // Submenú || Quechua || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 97:   // Submenú || Quechua || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 98:   // Submenú || Quechua || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 99:   // Submenú || Quechua || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 100:  // Submenú || Quechua || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 101:  // Submenú || Quechua || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 102:  // Submenú || Quechua || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 103:  // Submenú || Quechua || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 104:  // Submenú || Quechua || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 105:  // Submenú || Quechua || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 106:  // Submenú || Quechua || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 107:  // Submenú || Quechua || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 108:  // Submenú || Quechua || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 109:  // Submenú || Quechua || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 110:  // Submenú || Quechua || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 111:  // Submenú || Quechua || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 112:  // Submenú || Quechua || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 113:  // Submenú || Quechua || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 114:  // Submenú || Quechua || Animales || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 115:  // Submenú || Quechua || Animales || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 116:  // Submenú || Quechua || Animales || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      menuButtons[6].update();
      menuButtons[6].display();
      
      contenidoButtons[4].display();
      contenidoButtons[4].update();
      break;
    case 117:  // Submenú || Quechua || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Cantemos",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,int(altoGlobal/20));
      fill(153,51,102);
      text("Aysarillawan chutarillawan", width/2, altoGlobal/4);
      text("Pharilla phallchaschallay",width/2, altoGlobal/4 + altoGlobal/15);
      text("Kaylla sumaq panpachi",width/2, altoGlobal/4 + 2*altoGlobal/15);
      text("Pharilla phallchaschallay", width/2,  altoGlobal/4 + 3*altoGlobal/15);
      text("Icha ima ninkiraqchu",width/2, altoGlobal/4 + 4*altoGlobal/15);
      text("Pharilla phallchaschallay",width/2, altoGlobal/4 + 5*altoGlobal/15);
      
      menuButtons[8].update();
      menuButtons[8].display();
      break;
    case 118:  // Submenú || Shipibo
      background(255);
      textFont(fontsubmenu,int(altoGlobal/5));
      fill(98);
      text(lenguas[3],2.5*int(anchoGlobal/9),3*int(altoGlobal/13));
      for(int i=18;i<24;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 119:  // Submenú || Shipibo || Saludándonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - saludo y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 120:  // Submenú || Shipibo || Saludándonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - despedida y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 121:  // Submenú || Shipibo || Saludándonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - afirmación y negación",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 122:  // Submenú || Shipibo || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos -  ¿Cuál es tu nombre? / Mi nombre es _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 123:  // Submenú || Shipibo || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Cuántos años tienes? / Yo tengo _ años",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 124:  // Submenú || Shipibo || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿De dónde eres? / Yo soy de _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 125:  // Submenú || Shipibo || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Dónde vives? / Yo vivo en _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 126:  // Submenú || Shipibo || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿A dónde estás yendo? / Estoy yendo a _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 127:  // Submenú || Shipibo || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<3;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 128:  // Submenú || Shipibo || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo: Cantar",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=3;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 129:  // Submenú || Shipibo || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<9;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 130:  // Submenú || Shipibo || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=9;i<12;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 131:  // Submenú || Shipibo || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=12;i<15;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 132:  // Submenú || Shipibo || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      menuButtons[6].update();      //Limite forzado
      menuButtons[6].display();
      for(int i=15;i<18;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 133:  // Submenú || Shipibo || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 134:  // Submenú || Shipibo || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 135:  // Submenú || Shipibo || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 136:  // Submenú || Shipibo || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 137:  // Submenú || Shipibo || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 138:  // Submenú || Shipibo || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 139:  // Submenú || Shipibo || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 140:  // Submenú || Shipibo || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 141:  // Submenú || Shipibo || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 142:  // Submenú || Shipibo || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 143:  // Submenú || Shipibo || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 144:  // Submenú || Shipibo || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 145:  // Submenú || Shipibo || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 146:  // Submenú || Shipibo || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 147:  // Submenú || Shipibo || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 148:  // Submenú || Shipibo || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 149:  // Submenú || Shipibo || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 150:  // Submenú || Shipibo || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 151:  // Submenú || Shipibo || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 152:  // Submenú || Shipibo || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 153:  // Submenú || Shipibo || Animales || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 154:  // Submenú || Shipibo || Animales || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 155:  // Submenú || Shipibo || Animales || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      menuButtons[6].update();
      menuButtons[6].display();
      
      contenidoButtons[4].display();
      contenidoButtons[4].update();
      break;
    case 156:  // Submenú || Shipibo || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Cantemos",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,int(altoGlobal/20));
      fill(153,51,102);
      text("Atsa xeati", width/2, altoGlobal/4);
      text("Kikin noe",width/2, altoGlobal/4 + altoGlobal/15);
      text("Kari betan meskoa",width/2, altoGlobal/4 + 2*altoGlobal/15);
      text("Kikin noe", width/2,  altoGlobal/4 + 3*altoGlobal/15);
      text("Rabe nononra iaman jake",width/2, altoGlobal/4 + 4*altoGlobal/15);
      text("Nashi nashishamani kanx kanx ikai",width/2, altoGlobal/4 + 5*altoGlobal/15);
      
      menuButtons[8].update();
      menuButtons[8].display();
      break;
    case 157:  // Submenú || Matsiguenka
      background(238);
      textFont(fontsubmenu,int(altoGlobal/5));
      fill(98);
      text(lenguas[4],int(imagenRight.width/beta)+2.5*int(anchoGlobal/9),3*int(altoGlobal/13));
      for(int i=24;i<30;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 158:  // Submenú || Matsiguenka || Saludándonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - saludo y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 159:  // Submenú || Matsiguenka || Saludándonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - despedida y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 160:  // Submenú || Matsiguenka || Saludándonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - afirmación y negación",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 161:  // Submenú || Matsiguenka || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos -  ¿Cuál es tu nombre? / Mi nombre es _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 162:  // Submenú || Matsiguenka || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Cuántos años tienes? / Yo tengo _ años",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 163:  // Submenú || Matsiguenka || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿De dónde eres? / Yo soy de _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 164:  // Submenú || Matsiguenka || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Dónde vives? / Yo vivo en _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 165:  // Submenú || Matsiguenka || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿A dónde estás yendo? / Estoy yendo a _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 166:  // Submenú || Matsiguenka || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<3;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 167:  // Submenú || Matsiguenka || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo: Cantar",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=3;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 168:  // Submenú || Matsiguenka || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<9;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 169:  // Submenú || Matsiguenka || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=9;i<12;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 170:  // Submenú || Matsiguenka || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=12;i<15;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 171:  // Submenú || Matsiguenka || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);

      menuButtons[6].update();      //Limite forzado
      menuButtons[6].display();
      for(int i=15;i<18;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 172:  // Submenú || Matsiguenka || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 173:  // Submenú || Matsiguenka || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 174:  // Submenú || Matsiguenka || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 175:  // Submenú || Matsiguenka || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 176:  // Submenú || Matsiguenka || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 177:  // Submenú || Matsiguenka || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 178:  // Submenú || Matsiguenka || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 179:  // Submenú || Matsiguenka || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 180:  // Submenú || Matsiguenka || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 181:  // Submenú || Matsiguenka || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 182:  // Submenú || Matsiguenka || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 183:  // Submenú || Matsiguenka || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 184:  // Submenú || Matsiguenka || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 185:  // Submenú || Matsiguenka || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 186:  // Submenú || Matsiguenka || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 187:  // Submenú || Matsiguenka || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 188:  // Submenú || Matsiguenka || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 189:  // Submenú || Matsiguenka || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 190:  // Submenú || Matsiguenka || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 191:  // Submenú || Matsiguenka || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 192:  // Submenú || Matsiguenka || Animales || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 193:  // Submenú || Matsiguenka || Animales || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 194:  // Submenú || Matsiguenka || Animales || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      menuButtons[6].update();
      menuButtons[6].display();
      
      contenidoButtons[4].display();
      contenidoButtons[4].update();
      break;
    case 195:  // Submenú || Matsiguenka || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Cantemos",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,int(altoGlobal/30));
      fill(153,51,102);
      text("Kasankari kajuiki, kasankari otega;", width/2, altoGlobal/5);
      text("kasankari kajuiki, kasankari otega.",width/2, altoGlobal/5 + altoGlobal/25);
      text("Okiaenkatanakena nogirimashiku",width/2, altoGlobal/5 + 2*altoGlobal/25);
      text("kasakari kajuiki, kasankari otega.", width/2,  altoGlobal/5 + 3*altoGlobal/25);
      text("Okiaenkatanakena nanigakiku,",width/2, altoGlobal/5 + 4*altoGlobal/25);
      text("kasankari kajuiki, kasankari otega.",width/2, altoGlobal/5 + 5*altoGlobal/25);
      text("Okiaenkatanakena magatiro novatsaku,",width/2, altoGlobal/5 + 6*altoGlobal/25);
      text("kasankari kajuiki, kasankari otega.",width/2, altoGlobal/5 + 7*altoGlobal/25);
      text("Noshokavetanakarora otishi, tera osagite",width/2, altoGlobal/5 + 8*altoGlobal/25);
      text("kasankari kajuiki, kasankari otega",width/2, altoGlobal/5 + 9*altoGlobal/25);
      text("Irorotarityo maika gara nomagisantiro",width/2, altoGlobal/5 + 10*altoGlobal/25);
      text("okasankatakera, kasankari kajuiki, kasankari otega",width/2, altoGlobal/5 + 11*altoGlobal/25);
      text("Irorotarityo maika gara nomagisantiro okasankatakera,",width/2, altoGlobal/5 + 12*altoGlobal/25); 
      text("kasankari kajuiki, kasankari otega",width/2, altoGlobal/5 + 13*altoGlobal/25);
      text("¡Nero!...",width/2, altoGlobal/5 + 14*altoGlobal/25);
  
      
      menuButtons[8].update();
      menuButtons[8].display();
      break;
    case 196:  // Submenú || Yine
      background(238);
      textFont(fontsubmenu,int(altoGlobal/5));
      fill(98);
      text(lenguas[5],2.5*int(anchoGlobal/9),3*int(altoGlobal/13));
      for(int i=30;i<36;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 197:  // Submenú || Yine || Saludándonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - saludo y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 198:  // Submenú || Yine || Saludándonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - despedida y respuesta",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 199:  // Submenú || Yine || Saludándonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Saludándonos - afirmación y negación",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 200:  // Submenú || Yine || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos -  ¿Cuál es tu nombre? / Mi nombre es José",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 201:  // Submenú || Yine || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Cuántos años tienes? / Yo tengo _ años",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 202:  // Submenú || Yine || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿De dónde eres? / Yo soy de _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 203:  // Submenú || Yine || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿Dónde vives? / Yo vivo en _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 204:  // Submenú || Yine || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Conociéndonos - ¿A dónde estás yendo? / Estoy yendo a _",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 205:  // Submenú || Yine || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<3;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 206:  // Submenú || Yine || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo: Cantar",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=3;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 207:  // Submenú || Yine || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<9;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 208:  // Submenú || Yine || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=9;i<12;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 209:  // Submenú || Yine || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=12;i<15;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 210:  // Submenú || Yine || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();      //Limite forzado
      menuButtons[6].display();
      for(int i=15;i<18;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 211:  // Submenú || Yine || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 212:  // Submenú || Yine || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 213:  // Submenú || Yine || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 214:  // Submenú || Yine || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 215:  // Submenú || Yine || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 216:  // Submenú || Yine || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 217:  // Submenú || Yine || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 218:  // Submenú || Yine || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 219:  // Submenú || Yine || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 220:  // Submenú || Yine || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 221:  // Submenú || Yine || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 222:  // Submenú || Yine || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 223:  // Submenú || Yine || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 224:  // Submenú || Yine || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 225:  // Submenú || Yine || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 226:  // Submenú || Yine || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 227:  // Submenú || Yine || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 228:  // Submenú || Yine || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 229:  // Submenú || Yine || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=6;i<8;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 230:  // Submenú || Yine || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Madre tierra",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 231:  // Submenú || Yine || Animales || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      for(int i=0;i<2;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 232:  // Submenú || Yine || Animales || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=2;i<4;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 233:  // Submenú || Yine || Animales || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Animales",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      menuButtons[6].update();
      menuButtons[6].display();
      
      contenidoButtons[4].display();
      contenidoButtons[4].update();
      break;
    case 234:  // Submenú || Yine || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,int(altoGlobal/15));
      fill(98);
      text("Cantemos",int(anchoGlobal/9),1.5*int(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,int(altoGlobal/20));
      fill(153,51,102);
      text("Tnachnenro kamowni,", width/2, altoGlobal/4);
      text("tnachnenro kamowni",width/2, altoGlobal/4 + altoGlobal/15);
      text("goglugimatanunro goglugimatanunro",width/2, altoGlobal/4 + 2*altoGlobal/15);
      text("xako gitanukoka kamowashwatajiji", width/2,  altoGlobal/4 + 3*altoGlobal/15);
      text("tnachnenro kamowni tnachnenro kamowni",width/2, altoGlobal/4 + 4*altoGlobal/15);
      text("goglugimatanunro goglugimatanunro",width/2, altoGlobal/4 + 5*altoGlobal/15);
      text("xako gitanukoka kamoshwatajiji",width/2, altoGlobal/4 + 6*altoGlobal/15);
      
      menuButtons[8].update();
      menuButtons[8].display();
      break;
    default:
      activity = 0;
      background(255);
      break;
  }
}


//audio
/*void saludandonosa(){
  a01 = new APMediaPlayer(this); //create new APMediaPlayer
  a01.setMediaFile("a01.mp3"); //set the file (files are in data folder)
  a01.setLooping(false); //restart playback end reached
  a01.setVolume(1.0, 1.0);  
}
public void onDestroy() {
  super.onDestroy(); //call onDestroy on super class
  if(a01!=null) { //must be checked because or else crash when return from landscape mode
    a01.release(); //release the player
  }
}*/
public void onDestroy() {

  super.onDestroy(); //call onDestroy on super class
  if(p1!=null){ //must be checked because or else crash when return from landscape mode
    p1.release(); //release the player
  }
  if(p2!=null){
    p2.release();
  }
  if(p3!=null){
    p3.release();
  }
  if(p4!=null){
    p4.release();
  }
  if(p5!=null){
    p5.release();
  }
  if(p6!=null){
    p6.release();
  }
  if(p7!=null){
    p7.release();
  }
  if(p8!=null){
    p8.release();
  }
  if(p9!=null){
    p9.release();
  }
  if(p10!=null){
    p10.release();
  }
  if(p11!=null){
    p11.release();
  }
  if(p12!=null){
    p12.release();
  }
  if(p13!=null){
    p13.release();
  }
  if(p14!=null){
    p14.release();
  }
  if(p15!=null){
    p15.release();
  }
  if(p16!=null){
    p16.release();
  }
  if(p17!=null){
    p17.release();
  }
  if(p18!=null){
    p18.release();
  }
}

