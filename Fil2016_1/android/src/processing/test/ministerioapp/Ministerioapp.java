package processing.test.ministerioapp;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import apwidgets.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ministerioapp extends PApplet {

/*
lengua0=aymara
lengua1=jaqaru
lengua2=quechua
lengua3=shipibo
lengua4=matshiguenka
lengua5=yine
*/
 //libreria audio
APMediaPlayer p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18;

int j;
PFont fontMenu,fontsubMenu,fontsubmenu,fontcancion;
PImage imagenMin;
PImage imagenIntro;
PImage imagenRight;
PImage imagenLeft;

String[] lenguas = {"Aymara","Jaqaru","Quechua","Shipibo","Matsiguenka","Yine"}; 

boolean intro = true;

float anchoGlobal;
float altoGlobal;
float beta;

int n=6, m=34;
int activity = 0, last_activity = 0;
boolean bloqueado = false;

PImage[] file = new PImage[n];

PImage[] jaqaru_file = new PImage[m];  //Jaqaru
PImage[] jaqaru_base = new PImage[10];


ImageButtons[] menuButtons = new ImageButtons[n+4];
ImageButtons[] contenidoButtons = new ImageButtons[m*6];
float[] alfa = new float[n];
float[] escalador={1.0f,0.84f,0.87f,1.15f,0.84f,0.98f};
float[] modificadorvert={1.0f,1.02f,1.02f,1.05f,1.06f,0.95f};
float[] factorDesp={1.5f,1.195f,1.14f,1.14f,1.08f,1.085f};

SqButtons[] submenuButtons = new SqButtons[36];
String[] submenu = {"Salud\u00e1ndonos","Conoci\u00e9ndonos","Estamos viviendo","Madre tierra","Animales","Cantemos"}; 
String[][] SUBMENU = {{"Aruntasipxa\u00f1ani","U\u00f1t\u2019asipxa\u00f1ani","Jakasisipxktanwa","Pachamama","Uywanaka","Warurt\u2019apxa\u00f1ani"},
                      {"Amruchatxi sashtna","Illt\u2019ishitna","Jakasw jakktna","Uriqmama","Uywkuna","Katt\u2019atna"},
                      {"Napayukuspanchik","Riqsinakuspa","Kawsachkanchik","Pachamama","Uywakuna","Takisun"},
                      {"Jowe Ianananti","Onanananti","Noara japariax itai","Mai tita","Yoinabo","Bewanon ikanwe"},
                      {"Niavakagantsi","Neavakagantsi","Timagantsi","Onato kipatsi","Inkenishipagekunirira","Matikaigakera"},
                      {"Walukakanu","Wumatkakanu","Estamos viviendo","Madre tierra","Animales","Wsikalwatanu"}};

public void setup(){
 
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

  imagenMin=loadImage("mincultura.png");
  imagenIntro=loadImage("nombre.png");
  orientation(LANDSCAPE);
  
  for(int i=0;i<file.length;i++){
    file[i]=loadImage("lengua"+str(i)+".png");
    alfa[i]=escalador[i]*anchoGlobal/(8*file[i].width);
    menuButtons[i] = new ImageButtons(i,0,PApplet.parseInt(((3+2*i)*anchoGlobal/16)-(alfa[i]*file[i].width)/2),PApplet.parseInt(modificadorvert[i]*((altoGlobal/2)-(alfa[i]*file[i].height)/2)),PApplet.parseInt(alfa[i]*file[i].width),PApplet.parseInt(alfa[i]*file[i].height),file[i],file[i]); 
  }
  
  for(int i=0;i<SUBMENU.length;i++){
    for(int j=0;j<SUBMENU[0].length;j++){
      int k = (6*i)+j;
      submenuButtons[k] = new SqButtons(k,SUBMENU[i][j],submenu[j],PApplet.parseInt(anchoGlobal/9),PApplet.parseInt(altoGlobal/13));
    }
  }
  
  
  imagenRight=loadImage("right.png");
  beta = imagenRight.height/altoGlobal;
  menuButtons[7] = new ImageButtons(7,1,PApplet.parseInt(anchoGlobal-(imagenRight.width/beta))+1,0,PApplet.parseInt(imagenRight.width/beta),PApplet.parseInt(altoGlobal),imagenRight,imagenRight);  //Adelantar
  imagenLeft=loadImage("left.png");
  menuButtons[6] = new ImageButtons(6,2,0,0,PApplet.parseInt(imagenRight.width/beta),PApplet.parseInt(altoGlobal),imagenLeft,imagenLeft);   //Retrasar
  menuButtons[8] = new ImageButtons(8,2,0,0,PApplet.parseInt(imagenRight.width/beta),PApplet.parseInt(altoGlobal),imagenLeft,imagenLeft);   //Retrasar al submenu
  menuButtons[9] = new ImageButtons(9,2,0,0,PApplet.parseInt(imagenRight.width/beta),PApplet.parseInt(altoGlobal),imagenLeft,imagenLeft);   //Retrasar al menu principal

  fontMenu = loadFont("Haettenschweiler-48.vlw");
  fontsubMenu = loadFont("CourierNew36.vlw");
  fontsubmenu = loadFont("Haettenschweiler-100.vlw");
  fontcancion = loadFont("ComicSansMS-36.vlw");
  //agregar otro 

  //sonido
  //saludandonosa();
}

public void draw(){
  switch(activity){
    case 0:    // Men\u00fa principial ||Jaqaru Aymara Matsiguenka Quechua Shipibo Yine
        //Funci\u00f3n de entrada
        if (intro) {
            if(millis()<5000){
              background(0);
              imageMode(CENTER);
              image(imagenMin,anchoGlobal/2,altoGlobal/2,imagenMin.width*anchoGlobal/1360,imagenMin.height*anchoGlobal/1360);
              imageMode(CORNER);
            }
            else if(millis()<10000){
                background(0xffF20000);
                imageMode(CENTER);
                image(imagenIntro,anchoGlobal/2,altoGlobal/2,imagenIntro.width*anchoGlobal/1360,imagenIntro.height*anchoGlobal/1360);
                imageMode(CORNER);
                
                j=0;
                if(j==0){
                  imagenMin=loadImage("letraslema.png");
                  j=1;
                }
                
            }
            else { intro = false; }
        }
        //Funci\u00f3n display
        else{
          background(69,90,140);
          textFont(fontMenu,PApplet.parseInt(altoGlobal/16));
          fill(255);
          textAlign(CENTER);
          imageMode(CENTER);
          image(imagenMin,anchoGlobal/2,altoGlobal/4,imagenMin.width*anchoGlobal/800,imagenMin.height*anchoGlobal/800);
          imageMode(CORNER);
          //textSize(altoGlobal/16);
          for(int i=0;i<6;i++){
            text(lenguas[i],factorDesp[i]*PApplet.parseInt(((3+2*i)*anchoGlobal/16)-(alfa[i]*file[i].width)/2),PApplet.parseInt((1.1f*(altoGlobal/2)+(alfa[1]*file[1].height)/2)));  
          }
          for(int i=0;i<6;i++){
            menuButtons[i].update();
            menuButtons[i].display();
          }
        }
      break;
    case 1:    // Submen\u00fa || Aymara
      background(238);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/5));
      fill(98);
      text(lenguas[0],2.5f*PApplet.parseInt(anchoGlobal/9),3*PApplet.parseInt(altoGlobal/13));
      for(int i=0;i<6;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 2:    // Submen\u00fa || Aymara || Salud\u00e1ndonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - saludo y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 3:    // Submen\u00fa || Aymara || Salud\u00e1ndonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - despedida y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 4:    // Submen\u00fa || Aymara || Salud\u00e1ndonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - afirmaci\u00f3n y negaci\u00f3n",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 5:    // Submen\u00fa || Aymara || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos -  \u00bfCu\u00e1l es tu nombre? / Mi nombre es _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 6:    // Submen\u00fa || Aymara || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfCu\u00e1ntos a\u00f1os tienes? / Yo tengo _ a\u00f1os",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 7:    // Submen\u00fa || Aymara || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfDe d\u00f3nde eres? / Yo soy de _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 8:    // Submen\u00fa || Aymara || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfD\u00f3nde vives? / Yo vivo en _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 9:    // Submen\u00fa || Aymara || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfA d\u00f3nde est\u00e1s yendo? / Estoy yendo a _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 10:   // Submen\u00fa || Aymara || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 11:   // Submen\u00fa || Aymara || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 12:   // Submen\u00fa || Aymara || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 13:   // Submen\u00fa || Aymara || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 14:   // Submen\u00fa || Aymara || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 15:   // Submen\u00fa || Aymara || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=15;i<18;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 16:   // Submen\u00fa || Aymara || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 17:   // Submen\u00fa || Aymara || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 18:   // Submen\u00fa || Aymara || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 19:   // Submen\u00fa || Aymara || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 20:   // Submen\u00fa || Aymara || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 21:   // Submen\u00fa || Aymara || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 22:   // Submen\u00fa || Aymara || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 23:   // Submen\u00fa || Aymara || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 24:   // Submen\u00fa || Aymara || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 25:   // Submen\u00fa || Aymara || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 26:   // Submen\u00fa || Aymara || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 27:   // Submen\u00fa || Aymara || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 28:   // Submen\u00fa || Aymara || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 29:   // Submen\u00fa || Aymara || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 30:   // Submen\u00fa || Aymara || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 31:   // Submen\u00fa || Aymara || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 32:   // Submen\u00fa || Aymara || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 33:   // Submen\u00fa || Aymara || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 34:   // Submen\u00fa || Aymara || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 35:   // Submen\u00fa || Aymara || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 36:   // Submen\u00fa || Aymara || Animales || 1
      background(255);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      break;
    case 37:   // Submen\u00fa || Aymara || Animales || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 38:   // Submen\u00fa || Aymara || Animales || 3
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 39:   // Submen\u00fa || Aymara || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Cantemos",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,PApplet.parseInt(altoGlobal/30));
      fill(153,51,102);
      text("Suni payita mantanthaya", width/2, altoGlobal/4.5f);
      text("Aqarapita jiskhullani",width/2, altoGlobal/4.5f + altoGlobal/20);
      text("Suni payita mantanthaya",width/2, altoGlobal/4.5f + 2*altoGlobal/20);
      text("Chhullunkhayata jiskhullani", width/2,  altoGlobal/4.5f + 3*altoGlobal/20);
      text("Jumaru muniriwa mantanthaya",width/2, altoGlobal/4.5f + 4*altoGlobal/20);
      text("Jumaru waylluriwa saraqanthaya",width/2, altoGlobal/4.5f + 5*altoGlobal/20);
      text("Inacha munitani sasina",width/2, altoGlobal/4.5f + 6*altoGlobal/20);
      text("Inacha wayllutani sasina",width/2, altoGlobal/4.5f + 7*altoGlobal/20);
      text("Jumaru waylluriwa saraqanthaya",width/2, altoGlobal/4.5f + 8*altoGlobal/20);
      text("T\u2019ijxarakisma kullakaya",width/2, altoGlobal/4.5f + 9*altoGlobal/20);
      text("Chhaqxaralisma kullakaya",width/2, altoGlobal/4.5f + 10*altoGlobal/20);
      
      menuButtons[8].update();
      menuButtons[8].display();
      break;
    case 40:   // Submen\u00fa || Jaqaru
      background(238);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/5));
      fill(98);
      text(lenguas[1],2.5f*PApplet.parseInt(anchoGlobal/9),3*PApplet.parseInt(altoGlobal/13));
      for(int i=6;i<12;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 41:   // Submen\u00fa || Jaqaru || Salud\u00e1ndonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - saludo y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 42:   // Submen\u00fa || Jaqaru || Salud\u00e1ndonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - despedida y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 43:   // Submen\u00fa || Jaqaru || Salud\u00e1ndonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - afirmaci\u00f3n y negaci\u00f3n",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 44:   // Submen\u00fa || Jaqaru || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos -  \u00bfCu\u00e1l es tu nombre? / Mi nombre es _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 45:   // Submen\u00fa || Jaqaru || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfCu\u00e1ntos a\u00f1os tienes? / Yo tengo _ a\u00f1os",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 46:   // Submen\u00fa || Jaqaru || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfDe d\u00f3nde eres? / Yo soy de _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 47:   // Submen\u00fa || Jaqaru || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfD\u00f3nde vives? / Yo vivo en _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 48:   // Submen\u00fa || Jaqaru || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfA d\u00f3nde est\u00e1s yendo? / Estoy yendo a _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 49:   // Submen\u00fa || Jaqaru || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 50:   // Submen\u00fa || Jaqaru || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 51:   // Submen\u00fa || Jaqaru || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 52:   // Submen\u00fa || Jaqaru || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 53:   // Submen\u00fa || Jaqaru || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 54:   // Submen\u00fa || Jaqaru || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=15;i<18;i++){
        contenidoButtons[i].display();
        contenidoButtons[i].update();
      }
      break;
    case 55:   // Submen\u00fa || Jaqaru || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 56:   // Submen\u00fa || Jaqaru || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 57:   // Submen\u00fa || Jaqaru || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 58:   // Submen\u00fa || Jaqaru || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 59:   // Submen\u00fa || Jaqaru || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 60:   // Submen\u00fa || Jaqaru || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 61:   // Submen\u00fa || Jaqaru || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 62:   // Submen\u00fa || Jaqaru || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 63:   // Submen\u00fa || Jaqaru || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 64:   // Submen\u00fa || Jaqaru || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 65:   // Submen\u00fa || Jaqaru || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 66:   // Submen\u00fa || Jaqaru || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 67:   // Submen\u00fa || Jaqaru || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 68:   // Submen\u00fa || Jaqaru || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 69:   // Submen\u00fa || Jaqaru || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 70:   // Submen\u00fa || Jaqaru || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 71:   // Submen\u00fa || Jaqaru || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 72:   // Submen\u00fa || Jaqaru || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 73:   // Submen\u00fa || Jaqaru || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 74:   // Submen\u00fa || Jaqaru || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 75:   // Submen\u00fa || Jaqaru || Animales || 1
      background(255);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      break;
    case 76:   // Submen\u00fa || Jaqaru || Animales || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 77:   // Submen\u00fa || Jaqaru || Animales || 3
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 78:   // Submen\u00fa || Jaqaru || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Cantemos",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,PApplet.parseInt(altoGlobal/30));
      fill(153,51,102);
      text("T'akcham maqmata", width/2, altoGlobal/5);
      text("Ishkasw upaq akankitxi",width/2, altoGlobal/5 + altoGlobal/25);
      text("Jatzach jatzmanqa",width/2, altoGlobal/5 + 2*altoGlobal/25);
      text("\u00bfUpaq ujtqanitxi?", width/2,  altoGlobal/5 + 3*altoGlobal/25);
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
    case 79:   // Submen\u00fa || Quechua
      background(238);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/5));
      fill(98);
      text(lenguas[2],2.5f*PApplet.parseInt(anchoGlobal/9),3*PApplet.parseInt(altoGlobal/13));
      for(int i=12;i<18;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 80:   // Submen\u00fa || Quechua || Salud\u00e1ndonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - saludo y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 81:   // Submen\u00fa || Quechua || Salud\u00e1ndonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - despedida y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 82:   // Submen\u00fa || Quechua || Salud\u00e1ndonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - afirmaci\u00f3n y negaci\u00f3n",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 83:   // Submen\u00fa || Quechua || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos -  \u00bfCu\u00e1l es tu nombre? / Mi nombre es _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 84:   // Submen\u00fa || Quechua || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfCu\u00e1ntos a\u00f1os tienes? / Yo tengo _ a\u00f1os",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 85:   // Submen\u00fa || Quechua || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfDe d\u00f3nde eres? / Yo soy de _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 86:   // Submen\u00fa || Quechua || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfD\u00f3nde vives? / Yo vivo en _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 87:   // Submen\u00fa || Quechua || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfA d\u00f3nde est\u00e1s yendo? / Estoy yendo a _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 88:   // Submen\u00fa || Quechua || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 89:   // Submen\u00fa || Quechua || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 90:   // Submen\u00fa || Quechua || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 91:   // Submen\u00fa || Quechua || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 92:   // Submen\u00fa || Quechua || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 93:   // Submen\u00fa || Quechua || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=15;i<18;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 94:   // Submen\u00fa || Quechua || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 95:   // Submen\u00fa || Quechua || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 96:   // Submen\u00fa || Quechua || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 97:   // Submen\u00fa || Quechua || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 98:   // Submen\u00fa || Quechua || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 99:   // Submen\u00fa || Quechua || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 100:  // Submen\u00fa || Quechua || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 101:  // Submen\u00fa || Quechua || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 102:  // Submen\u00fa || Quechua || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 103:  // Submen\u00fa || Quechua || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 104:  // Submen\u00fa || Quechua || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 105:  // Submen\u00fa || Quechua || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 106:  // Submen\u00fa || Quechua || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 107:  // Submen\u00fa || Quechua || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 108:  // Submen\u00fa || Quechua || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 109:  // Submen\u00fa || Quechua || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 110:  // Submen\u00fa || Quechua || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 111:  // Submen\u00fa || Quechua || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 112:  // Submen\u00fa || Quechua || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 113:  // Submen\u00fa || Quechua || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 114:  // Submen\u00fa || Quechua || Animales || 1
      background(255);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      break;
    case 115:  // Submen\u00fa || Quechua || Animales || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 116:  // Submen\u00fa || Quechua || Animales || 3
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 117:  // Submen\u00fa || Quechua || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Cantemos",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,PApplet.parseInt(altoGlobal/20));
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
    case 118:  // Submen\u00fa || Shipibo
      background(255);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/5));
      fill(98);
      text(lenguas[3],2.5f*PApplet.parseInt(anchoGlobal/9),3*PApplet.parseInt(altoGlobal/13));
      for(int i=18;i<24;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 119:  // Submen\u00fa || Shipibo || Salud\u00e1ndonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - saludo y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 120:  // Submen\u00fa || Shipibo || Salud\u00e1ndonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - despedida y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 121:  // Submen\u00fa || Shipibo || Salud\u00e1ndonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - afirmaci\u00f3n y negaci\u00f3n",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 122:  // Submen\u00fa || Shipibo || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos -  \u00bfCu\u00e1l es tu nombre? / Mi nombre es _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 123:  // Submen\u00fa || Shipibo || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfCu\u00e1ntos a\u00f1os tienes? / Yo tengo _ a\u00f1os",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 124:  // Submen\u00fa || Shipibo || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfDe d\u00f3nde eres? / Yo soy de _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 125:  // Submen\u00fa || Shipibo || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfD\u00f3nde vives? / Yo vivo en _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 126:  // Submen\u00fa || Shipibo || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfA d\u00f3nde est\u00e1s yendo? / Estoy yendo a _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 127:  // Submen\u00fa || Shipibo || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 128:  // Submen\u00fa || Shipibo || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 129:  // Submen\u00fa || Shipibo || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 130:  // Submen\u00fa || Shipibo || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 131:  // Submen\u00fa || Shipibo || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 132:  // Submen\u00fa || Shipibo || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=15;i<18;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 133:  // Submen\u00fa || Shipibo || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 134:  // Submen\u00fa || Shipibo || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 135:  // Submen\u00fa || Shipibo || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 136:  // Submen\u00fa || Shipibo || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 137:  // Submen\u00fa || Shipibo || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 138:  // Submen\u00fa || Shipibo || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 139:  // Submen\u00fa || Shipibo || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 140:  // Submen\u00fa || Shipibo || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 141:  // Submen\u00fa || Shipibo || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 142:  // Submen\u00fa || Shipibo || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 143:  // Submen\u00fa || Shipibo || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 144:  // Submen\u00fa || Shipibo || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 145:  // Submen\u00fa || Shipibo || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 146:  // Submen\u00fa || Shipibo || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 147:  // Submen\u00fa || Shipibo || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 148:  // Submen\u00fa || Shipibo || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 149:  // Submen\u00fa || Shipibo || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 150:  // Submen\u00fa || Shipibo || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 151:  // Submen\u00fa || Shipibo || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 152:  // Submen\u00fa || Shipibo || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 153:  // Submen\u00fa || Shipibo || Animales || 1
      background(255);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      break;
    case 154:  // Submen\u00fa || Shipibo || Animales || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 155:  // Submen\u00fa || Shipibo || Animales || 3
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 156:  // Submen\u00fa || Shipibo || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Cantemos",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,PApplet.parseInt(altoGlobal/20));
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
    case 157:  // Submen\u00fa || Matsiguenka
      background(238);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/5));
      fill(98);
      text(lenguas[4],PApplet.parseInt(imagenRight.width/beta)+2.5f*PApplet.parseInt(anchoGlobal/9),3*PApplet.parseInt(altoGlobal/13));
      for(int i=24;i<30;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 158:  // Submen\u00fa || Matsiguenka || Salud\u00e1ndonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - saludo y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 159:  // Submen\u00fa || Matsiguenka || Salud\u00e1ndonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - despedida y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 160:  // Submen\u00fa || Matsiguenka || Salud\u00e1ndonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - afirmaci\u00f3n y negaci\u00f3n",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 161:  // Submen\u00fa || Matsiguenka || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos -  \u00bfCu\u00e1l es tu nombre? / Mi nombre es _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 162:  // Submen\u00fa || Matsiguenka || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfCu\u00e1ntos a\u00f1os tienes? / Yo tengo _ a\u00f1os",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 163:  // Submen\u00fa || Matsiguenka || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfDe d\u00f3nde eres? / Yo soy de _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 164:  // Submen\u00fa || Matsiguenka || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfD\u00f3nde vives? / Yo vivo en _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 165:  // Submen\u00fa || Matsiguenka || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfA d\u00f3nde est\u00e1s yendo? / Estoy yendo a _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 166:  // Submen\u00fa || Matsiguenka || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 167:  // Submen\u00fa || Matsiguenka || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 168:  // Submen\u00fa || Matsiguenka || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 169:  // Submen\u00fa || Matsiguenka || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 170:  // Submen\u00fa || Matsiguenka || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 171:  // Submen\u00fa || Matsiguenka || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=15;i<18;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 172:  // Submen\u00fa || Matsiguenka || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 173:  // Submen\u00fa || Matsiguenka || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 174:  // Submen\u00fa || Matsiguenka || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 175:  // Submen\u00fa || Matsiguenka || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 176:  // Submen\u00fa || Matsiguenka || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 177:  // Submen\u00fa || Matsiguenka || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 178:  // Submen\u00fa || Matsiguenka || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 179:  // Submen\u00fa || Matsiguenka || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 180:  // Submen\u00fa || Matsiguenka || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 181:  // Submen\u00fa || Matsiguenka || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 182:  // Submen\u00fa || Matsiguenka || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 183:  // Submen\u00fa || Matsiguenka || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 184:  // Submen\u00fa || Matsiguenka || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 185:  // Submen\u00fa || Matsiguenka || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 186:  // Submen\u00fa || Matsiguenka || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 187:  // Submen\u00fa || Matsiguenka || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 188:  // Submen\u00fa || Matsiguenka || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 189:  // Submen\u00fa || Matsiguenka || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 190:  // Submen\u00fa || Matsiguenka || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 191:  // Submen\u00fa || Matsiguenka || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 192:  // Submen\u00fa || Matsiguenka || Animales || 1
      background(255);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      break;
    case 193:  // Submen\u00fa || Matsiguenka || Animales || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 194:  // Submen\u00fa || Matsiguenka || Animales || 3
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 195:  // Submen\u00fa || Matsiguenka || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Cantemos",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,PApplet.parseInt(altoGlobal/30));
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
      text("\u00a1Nero!...",width/2, altoGlobal/5 + 14*altoGlobal/25);
  
      
      menuButtons[8].update();
      menuButtons[8].display();
      break;
    case 196:  // Submen\u00fa || Yine
      background(238);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/5));
      fill(98);
      text(lenguas[5],2.5f*PApplet.parseInt(anchoGlobal/9),3*PApplet.parseInt(altoGlobal/13));
      for(int i=30;i<36;i++){
        submenuButtons[i].update();
        submenuButtons[i].display();  
      }
      menuButtons[9].update();
      menuButtons[9].display();
      break; 
    case 197:  // Submen\u00fa || Yine || Salud\u00e1ndonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - saludo y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 198:  // Submen\u00fa || Yine || Salud\u00e1ndonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - despedida y respuesta",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 199:  // Submen\u00fa || Yine || Salud\u00e1ndonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Salud\u00e1ndonos - afirmaci\u00f3n y negaci\u00f3n",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=4;i<6;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 200:  // Submen\u00fa || Yine || Conociendonos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos -  \u00bfCu\u00e1l es tu nombre? / Mi nombre es _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 201:  // Submen\u00fa || Yine || Conociendonos || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfCu\u00e1ntos a\u00f1os tienes? / Yo tengo _ a\u00f1os",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 202:  // Submen\u00fa || Yine || Conociendonos || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfDe d\u00f3nde eres? / Yo soy de _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 203:  // Submen\u00fa || Yine || Conociendonos || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfD\u00f3nde vives? / Yo vivo en _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 204:  // Submen\u00fa || Yine || Conociendonos || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Conoci\u00e9ndonos - \u00bfA d\u00f3nde est\u00e1s yendo? / Estoy yendo a _",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 205:  // Submen\u00fa || Yine || Verbo: Cantar || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 206:  // Submen\u00fa || Yine || Verbo: Cantar || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 207:  // Submen\u00fa || Yine || Verbo: Cantar || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 208:  // Submen\u00fa || Yine || Verbo: Cantar || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 1ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 209:  // Submen\u00fa || Yine || Verbo: Cantar || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 2da persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 210:  // Submen\u00fa || Yine || Verbo: Cantar || 6
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Estamos viviendo - verbo cantar 3ra persona plural",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      for(int i=15;i<18;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 211:  // Submen\u00fa || Yine || Verbo: Cantar || 7
      background(255);
      
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 212:  // Submen\u00fa || Yine || Verbo: Caminar || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 213:  // Submen\u00fa || Yine || Verbo: Caminar || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 214:  // Submen\u00fa || Yine || Verbo: Caminar || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 215:  // Submen\u00fa || Yine || Verbo: Caminar || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 216:  // Submen\u00fa || Yine || Verbo: Caminar || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 217:  // Submen\u00fa || Yine || Verbo: Caminar || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 218:  // Submen\u00fa || Yine || Verbo: Caminar || 7
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 219:  // Submen\u00fa || Yine || Verbo: Comer || 1
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 220:  // Submen\u00fa || Yine || Verbo: Comer || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 221:  // Submen\u00fa || Yine || Verbo: Comer || 3
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 222:  // Submen\u00fa || Yine || Verbo: Comer || 4
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 223:  // Submen\u00fa || Yine || Verbo: Comer || 5
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 224:  // Submen\u00fa || Yine || Verbo: Comer || 6
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 225:  // Submen\u00fa || Yine || Verbo: Comer || 7
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 226:  // Submen\u00fa || Yine || Madre tierra || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 227:  // Submen\u00fa || Yine || Madre tierra || 2
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 228:  // Submen\u00fa || Yine || Madre tierra || 3
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 229:  // Submen\u00fa || Yine || Madre tierra || 4
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
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
    case 230:  // Submen\u00fa || Yine || Madre tierra || 5
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Madre tierra",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      menuButtons[6].update();
      menuButtons[6].display();
      for(int i=8;i<10;i++){
       contenidoButtons[i].display();
       contenidoButtons[i].update();
      }
      break;
    case 231:  // Submen\u00fa || Yine || Animales || 1
      background(255);
      for(int i=7;i<=8;i++){
        menuButtons[i].update();
        menuButtons[i].display();  
      }
      break;
    case 232:  // Submen\u00fa || Yine || Animales || 2
      background(255);
      for(int i=6;i<=7;i++){
        menuButtons[i].update();
        menuButtons[i].display();
      }
      break;
    case 233:  // Submen\u00fa || Yine || Animales || 3
      background(255);
      menuButtons[6].update();
      menuButtons[6].display();
      break;
    case 234:  // Submen\u00fa || Yine || Cantemos || 1
      background(255);
      textAlign(LEFT);
      textFont(fontsubmenu,PApplet.parseInt(altoGlobal/15));
      fill(98);
      text("Cantemos",PApplet.parseInt(anchoGlobal/9),1.5f*PApplet.parseInt(altoGlobal/13));
      textAlign(CENTER);
      
      textFont(fontcancion,PApplet.parseInt(altoGlobal/20));
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

class Button
{
  int x, y;
  int w, h;
  boolean over = false;
  boolean pressed = false;
  boolean beforepressed = false;  
  
  public void pressed() {
    
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
  
  public boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}
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
    w = PApplet.parseInt(ibase.width*k);
    h = PApplet.parseInt(ibase.height*k);
    switch(objetos){
      case 0:    //2 sujetos
        switch(posicion){
          case 0:
            x = PApplet.parseInt(anchoGlobal/5);
            y = PApplet.parseInt(altoGlobal/5);
            break;
          case 1:
            x = PApplet.parseInt(anchoGlobal/2);
            y = PApplet.parseInt(altoGlobal/5);
            break;
        }
        break;
      case 1:    //3 sujetos
        switch(posicion){
          case 0:
            x = PApplet.parseInt(anchoGlobal/20);
            y = PApplet.parseInt(altoGlobal/5);
            break;
          case 1:
            x = PApplet.parseInt(anchoGlobal/2.9f);
            y = PApplet.parseInt(altoGlobal/5);
            break;
          case 2:
            x = PApplet.parseInt(anchoGlobal/1.6f);
            y = PApplet.parseInt(altoGlobal/5);
            break;
        }
        break;
      case 2:    //2 objetos
        switch(posicion){
          case 0:
            x = PApplet.parseInt(anchoGlobal/5);
            y = PApplet.parseInt(altoGlobal/5);
            break;
          case 1:
            x = PApplet.parseInt(anchoGlobal/2);
            y = PApplet.parseInt(altoGlobal/5);
            break;
        }
        break;
    }
    currentimage = base;
    currenttexto = "";
  }
  
  public void update() {
    over();
    pressed();
    switch(modo){
      case 0:    //Men\u00fa pricipal
        if(pressed && (ID<=5)) {
          switch(ID) {
            case 0:      //Submen\u00fa Aymara
              activity = 1;
              break;
            case 1:      //Submen\u00fa Jaqaru
              activity = 40;
              break;
            case 2:      //Submen\u00fa Quechua
              activity = 79;
              break;
            case 3:      //Submen\u00fa Shipibo
              activity = 118;
              break;
            case 4:      //Submen\u00fa Matsiguenka
              activity = 157;
              break;
            case 5:      //Submen\u00fa Yine
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
  
  public void over(){
    if( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }
  
  public void display(){
    image(currentimage, x, y, w, h);
    fill(0);
    textFont(fontsubMenu,PApplet.parseInt(altoGlobal/30));
    text(currenttexto,x+anchoGlobal/8,y+altoGlobal/60);
    
  }
}
class SqButtons extends Button {
  int TXT = 255;
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
  
  public void update() {
    over();
    pressed();
    if(pressed){
      switch(ID){
        case 0:    //Submen\u00fa Aymara || Salud\u00e1ndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[0]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[0]+str(i)+".png");
              
              p1.setMediaFile("a01.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
               
              p2.setMediaFile("a02.mp3"); 
              p2.setLooping(false); 
              p2.setVolume(1.0f, 1.0f);
              
              p3.setMediaFile("a03.mp3"); 
              p3.setLooping(false); 
              p3.setVolume(1.0f, 1.0f);
               
              p4.setMediaFile("a04.mp3"); 
              p4.setLooping(false); 
              p4.setVolume(1.0f, 1.0f);
              
              p5.setMediaFile("a05.mp3"); 
              p5.setLooping(false); 
              p5.setVolume(1.0f, 1.0f);
               
              p6.setMediaFile("a06.mp3"); 
              p6.setLooping(false); 
              p6.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kamisaraki",p1);  //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Waliki",p2);  //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Jakisi\u00f1kama",p3);  //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Jakisi\u00f1kama",p4);  //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Jisa",p5);  //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Jani",p6);  //Saludandonos || 5 || No
            j=1;
          }
          //////////////////////////////////////////
          activity = 2;
          break;
        case 1:    //Submen\u00fa Aymara || Conoci\u00e9ndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[0]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[0]+str(i+6)+".png");
              
              p1.setMediaFile("a11.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
               
              p2.setMediaFile("a12.mp3"); 
              p2.setLooping(false); 
              p2.setVolume(1.0f, 1.0f);
              
              p3.setMediaFile("vacio.mp3"); 
              p3.setLooping(false); 
              p3.setVolume(1.0f, 1.0f);
               
              p4.setMediaFile("a15.mp3"); 
              p4.setLooping(false); 
              p4.setVolume(1.0f, 1.0f);
              
              p5.setMediaFile("a16.mp3"); 
              p5.setLooping(false); 
              p5.setVolume(1.0f, 1.0f);
               
              p6.setMediaFile("a17.mp3"); 
              p6.setLooping(false); 
              p6.setVolume(1.0f, 1.0f);
              
              p7.setMediaFile("a18.mp3"); 
              p7.setLooping(false); 
              p7.setVolume(1.0f, 1.0f);
              
              p8.setMediaFile("a19.mp3"); 
              p8.setLooping(false); 
              p8.setVolume(1.0f, 1.0f);
              
              p9.setMediaFile("a20.mp3"); 
              p9.setLooping(false); 
              p9.setVolume(1.0f, 1.0f);
              
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kunasa sutima?",p1);  //Conoci\u00e9ndonos || 6 || \u00bfCu\u00e1l es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Nayana sutijaxa ___",p2);  //Conoci\u00e9ndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"Qhawqha maranitasa?",p3);  //Conoci\u00e9ndonos || 8 || \u00bfCu\u00e1ntos a\u00f1os tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Nayaxa ___ maranithwa",p3);  //Conoci\u00e9ndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"Kawkithatasa?",p4);  //Conoci\u00e9ndonos || 10 || \u00bfDe d\u00f3nde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"nayaxa ___ thathwa",p5);  //Conoci\u00e9ndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kawkinsa utjta?",p6);  //Conoci\u00e9ndonos || 12 || \u00bfD\u00f3nde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"nayaxa ___ na utjtha",p7);  //Conoci\u00e9ndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kawkirusa saraskta?",p8);  //Conoci\u00e9ndonos || 14 || \u00bfA d\u00f3nde est\u00e1s yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"___ru sarasktha",p9);  //Conoci\u00e9ndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 5;
          break;
        case 2:    //Submen\u00fa Aymara || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[0]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[0]+str(i+16)+".png");
              
              p1.setMediaFile("a21.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
               
              p2.setMediaFile("vacio.mp3"); 
              p2.setLooping(false); 
              p2.setVolume(1.0f, 1.0f);
              
              p3.setMediaFile("a23.mp3"); 
              p3.setLooping(false); 
              p3.setVolume(1.0f, 1.0f);
               
              p4.setMediaFile("a24.mp3"); 
              p4.setLooping(false); 
              p4.setVolume(1.0f, 1.0f);
              
              p5.setMediaFile("a26.mp3"); 
              p5.setLooping(false); 
              p5.setVolume(1.0f, 1.0f);
               
              p6.setMediaFile("a27.mp3"); 
              p6.setLooping(false); 
              p6.setVolume(1.0f, 1.0f);
              
              p7.setMediaFile("a28.mp3"); 
              p7.setLooping(false); 
              p7.setVolume(1.0f, 1.0f);
              
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Naya warurt\u2019tha",p1);  //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Naya warurt\u2019awtha",p2);  //Estamos viviendo || 17 || To cant\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Naya warurt\u2019\u00e4ja",p3);  //Estamos viviendo || 18 || Yo cantar\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Juma warurt\u2019ta",p4);  //Estamos viviendo || 19 || T\u00fa cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Juma warurt\u2019awta",p2);  //Estamos viviendo || 20 || T\u00fa cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Juma warurt\u2019\u00e4ta",p5);  //Estamos viviendo || 21 || T\u00fa cantar\u00e1s
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jupa warurt\u2019i",p6);  //Estamos viviendo || 22 || \u00c9l canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jupa warurt\u2019awi",p7);  //Estamos viviendo || 23 || \u00c9l cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jupa  warurt\u2019\u00e4ni",p2);  //Estamos viviendo || 24 || \u00c9l cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jupa warurt\u2019i",p6);  //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jupa warurt\u2019awi",p7);  //Estamos viviendo || 26 || Ella cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jupa warurt\u2019ani",p2);  //Estamos viviendo || 27 || Ella cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jiwasa warurt\u2019tana",p2);  //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jiwasa warurt\u2019awtana",p2);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jiwasa warurt\u2019a\u00f1ani",p2);  //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jumanaka warurt\u2019apxta",p2);  //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jumanaka warurt\u2019awapxta",p2);  //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jumanaka warurt\u2019awapxata",p2);  //Estamos viviendo || 33 || Ustedes cantar\u00e1n
            j=1;
          }
          //////////////////////////////////////////
          activity = 10;
          break;
        case 3:    //Submen\u00fa Aymara || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              //if(i<10){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i+3)+".png");
              //}
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+70)+".png");
              
              p1.setMediaFile("a31.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
               
              p2.setMediaFile("a32.mp3"); 
              p2.setLooping(false); 
              p2.setVolume(1.0f, 1.0f);
              
              p3.setMediaFile("a33.mp3"); 
              p3.setLooping(false); 
              p3.setVolume(1.0f, 1.0f);
               
              p4.setMediaFile("a34.mp3"); 
              p4.setLooping(false); 
              p4.setVolume(1.0f, 1.0f);
              
              p5.setMediaFile("a35.mp3"); 
              p5.setLooping(false); 
              p5.setVolume(1.0f, 1.0f);
               
              p6.setMediaFile("a36.mp3"); 
              p6.setLooping(false); 
              p6.setVolume(1.0f, 1.0f);
              
              p7.setMediaFile("a37.mp3"); 
              p7.setLooping(false); 
              p7.setVolume(1.0f, 1.0f);
              
              p8.setMediaFile("a38.mp3"); 
              p8.setLooping(false); 
              p8.setVolume(1.0f, 1.0f);
              
              p9.setMediaFile("a39.mp3"); 
              p9.setLooping(false); 
              p9.setVolume(1.0f, 1.0f);
              
              p10.setMediaFile("a310.mp3"); 
              p10.setLooping(false); 
              p10.setVolume(1.0f, 1.0f);
              
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_file[i++],false,"Quqa",p1);  //Madre tierra || 34 || \u00c1rbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_file[i++],false,"Jawira",p2);  //Madre tierra || 35 || R\u00edo 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_file[i++],false,"Qinaya",p3);  //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_file[i++],false,"Jallu",p4);  //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_file[i++],false,"Uta",p5);  //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_file[i++],false,"Manq\u2019a",p6);  //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_file[i++],false,"Inti/lupi/willka",p7);  //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_file[i++],false,"Phaxsi",p8);  //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_file[i++],false,"Warawara",p9);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_file[i++],false,"Nina",p10);  //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 31;
          break;
        case 4:    //Submen\u00fa Aymara || Animales
          activity = 36;
          break;
        case 5:    //Submen\u00fa Aymara || Abecedario
          activity = 39;
          break;
        case 6:    //Submen\u00fa Jaqaru || Salud\u00e1ndonos
          ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[1]+str(i)+".png");
              
              p1.setMediaFile("j01.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
               
              p2.setMediaFile("j02.mp3"); 
              p2.setLooping(false); 
              p2.setVolume(1.0f, 1.0f);
              
              p3.setMediaFile("j03.mp3"); 
              p3.setLooping(false); 
              p3.setVolume(1.0f, 1.0f);
               
              p4.setMediaFile("j04.mp3"); 
              p4.setLooping(false); 
              p4.setVolume(1.0f, 1.0f);
              
              p5.setMediaFile("j05.mp3"); 
              p5.setLooping(false); 
              p5.setVolume(1.0f, 1.0f);
               
              p6.setMediaFile("j06.mp3"); 
              p6.setLooping(false); 
              p6.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfAmruchatxi?",p1);  //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Amruchawa",p2);  //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Maqktkaswa",p3);  //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Amruch maqmata",p4);  //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Jawilli",p5);  //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Ishawa",p6);  //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 41;
          break;
        case 7:    //Submen\u00fa Jaqaru || Conoci\u00e9ndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+6)+".png");
              
              p1.setMediaFile("j11.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
              
              p2.setMediaFile("j12.mp3"); 
              p2.setLooping(false); 
              p2.setVolume(1.0f, 1.0f);
              
              p3.setMediaFile("j13.mp3"); 
              p3.setLooping(false); 
              p3.setVolume(1.0f, 1.0f);
              
              p4.setMediaFile("j14.mp3"); 
              p4.setLooping(false); 
              p4.setVolume(1.0f, 1.0f);
              
              p5.setMediaFile("vacio.mp3"); 
              p5.setLooping(false); 
              p5.setVolume(1.0f, 1.0f);
              
              p6.setMediaFile("j17.mp3"); 
              p6.setLooping(false); 
              p6.setVolume(1.0f, 1.0f);
              
              p7.setMediaFile("j18.mp3"); 
              p7.setLooping(false); 
              p7.setVolume(1.0f, 1.0f);
              
              p8.setMediaFile("j19.mp3"); 
              p8.setLooping(false); 
              p8.setVolume(1.0f, 1.0f);
              
              p9.setMediaFile("j20.mp3"); 
              p9.setLooping(false); 
              p9.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfQuwas shutxim?",p1);  //Conoci\u00e9ndonos || 6 || \u00bfCu\u00e1l es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Shutxinhq ___ wa",p2);  //Conoci\u00e9ndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfAyk watawtasa?",p3);  //Conoci\u00e9ndonos || 8 || \u00bfCu\u00e1ntos a\u00f1os tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Naq ___ watawt\u2019wa",p4);  //Conoci\u00e9ndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfQawit\u2019  jaqiwtasa?",p5);  //Conoci\u00e9ndonos || 10 || \u00bfDe d\u00f3nde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Naq ___t\u2019 jaqiwt\u2019wa",p5);  //Conoci\u00e9ndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfQawinas jakkta?",p6);  //Conoci\u00e9ndonos || 12 || \u00bfD\u00f3nde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naq ___nw jakkt\u2019a",p7);  //Conoci\u00e9ndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfQawas makta?",p8);  //Conoci\u00e9ndonos || 14 || \u00bfA d\u00f3nde est\u00e1s yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naq ___w makt\u2019a",p9);  //Conoci\u00e9ndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 44;
          break;
        case 8:    //Submen\u00fa Jaqaru || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+16)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Na kantkt\u2019a",p1);  //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Na kantawt\u2019a",p1);  //Estamos viviendo || 17 || To cant\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Na kantanha",p1);  //Estamos viviendo || 18 || Yo cantar\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Juma Kantkta",p1);  //Estamos viviendo || 19 || T\u00fa cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Juma kantawta",p1);  //Estamos viviendo || 20 || T\u00fa cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Juma kantmata",p1);  //Estamos viviendo || 21 || T\u00fa cantar\u00e1s
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Upa kantki",p1);  //Estamos viviendo || 22 || \u00c9l canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Upa kantawi",p1);  //Estamos viviendo || 23 || \u00c9l cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Upa kantani",p1);  //Estamos viviendo || 24 || \u00c9l cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jiwsa kantktna",p1);  //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jiwsa kantawtna",p1);  //Estamos viviendo || 26 || Ella cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jiwsa kantatna",p1);  //Estamos viviendo || 27 || Ella cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Jumkuna kantkta",p1);  //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Jumkuna kantawta",p1);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Jumkuna kantmata",p1);  //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Upkuna kantki",p1);  //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Upkuna kantawi",p1);  //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Upkuna kantani",p1);  //Estamos viviendo || 33 || Ustedes cantar\u00e1n
            j=1;
          }
          //////////////////////////////////////////
          activity = 49;
          break;
        case 9:    //Submen\u00fa Jaqaru || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              //if(i<10){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i+3)+".png");
              //}
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+70)+".png");
              
              p1.setMediaFile("j31.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
              
              p2.setMediaFile("j32.mp3"); 
              p2.setLooping(false); 
              p2.setVolume(1.0f, 1.0f);
              
              p3.setMediaFile("j33.mp3"); 
              p3.setLooping(false); 
              p3.setVolume(1.0f, 1.0f);
              
              p4.setMediaFile("j34.mp3"); 
              p4.setLooping(false); 
              p4.setVolume(1.0f, 1.0f);
              
              p5.setMediaFile("j35.mp3"); 
              p5.setLooping(false); 
              p5.setVolume(1.0f, 1.0f);
              
              p6.setMediaFile("j36.mp3"); 
              p6.setLooping(false); 
              p6.setVolume(1.0f, 1.0f);
              
              p7.setMediaFile("j37.mp3"); 
              p7.setLooping(false); 
              p7.setVolume(1.0f, 1.0f);
              
              p8.setMediaFile("j38.mp3"); 
              p8.setLooping(false); 
              p8.setVolume(1.0f, 1.0f);
              
              p9.setMediaFile("j39.mp3"); 
              p9.setLooping(false); 
              p9.setVolume(1.0f, 1.0f);
              
              p10.setMediaFile("vacio.mp3"); 
              p10.setLooping(false); 
              p10.setVolume(1.0f, 1.0f);
              
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_file[i++],false,"Ajtz\u2019 munti",p1);  //Madre tierra || 34 || \u00c1rbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_file[i++],false,"Mayu",p2);  //Madre tierra || 35 || R\u00edo 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_file[i++],false,"Urpi",p3);  //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_file[i++],false,"Jallu",p4);  //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_file[i++],false,"Uta",p5);  //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_file[i++],false,"Putaka",p6);  //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_file[i++],false,"Inti",p7);  //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_file[i++],false,"Pajshi",p8);  //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_file[i++],false,"Waraja",p9);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_file[i++],false,"Nina",p10);  //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 70;
          break;
        case 10:   //Submen\u00fa Jaqaru || Animales
          activity = 75;
          break;
        case 11:   //Submen\u00fa Jaqaru || Abecedario
          activity = 78;
          break;
        case 12:   //Submen\u00fa Quechua || Salud\u00e1ndonos
          ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[2]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[2]+str(i)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Allillanchu/imaynalla",p1);  //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Allillanmi/sumaqlla",p1);  //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kutimunaykama/huk kutinkama",p1);  //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Tupananchikkama/tupasun\u00f1a",p1);  //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Ar\u00ed",p1);  //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Manam",p1);  //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 80;
          break;
        case 13:   //Submen\u00fa Quechua || Conoci\u00e9ndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[2]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[2]+str(i+6)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfIman sutiyki?",p1);  //Conoci\u00e9ndonos || 6 || \u00bfCu\u00e1l es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"sutiyqa ___",p1);  //Conoci\u00e9ndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfHayk\u2019a watayuqmi kachkanki?",p1);  //Conoci\u00e9ndonos || 8 || \u00bfCu\u00e1ntos a\u00f1os tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"___ watayuq",p1);  //Conoci\u00e9ndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfMaymanta kanki?",p1);  //Conoci\u00e9ndonos || 10 || \u00bfDe d\u00f3nde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"___manta kani",p1);  //Conoci\u00e9ndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfMaypi Tiyanki?",p1);  //Conoci\u00e9ndonos || 12 || \u00bfD\u00f3nde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"___pi tiyani",p1);  //Conoci\u00e9ndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfMayta richkanki?",p1);  //Conoci\u00e9ndonos || 14 || \u00bfA d\u00f3nde est\u00e1s yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"___man richkani",p1);  //Conoci\u00e9ndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 83;
          break;
        case 14:   //Submen\u00fa Quechua || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[2]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[2]+str(i+16)+".png");
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"\u00d1uqam takichkani/takini",p1);  //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"\u00d1uqam takimurqani",p1);  //Estamos viviendo || 17 || To cant\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Qam takimusaq",p1);  //Estamos viviendo || 18 || Yo cantar\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Qam takichkanki",p1);  //Estamos viviendo || 19 || T\u00fa cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Qam takirqanki",p1);  //Estamos viviendo || 20 || T\u00fa cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Qam takinki",p1);  //Estamos viviendo || 21 || T\u00fa cantar\u00e1s
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Pay takichkan/takin",p1);  //Estamos viviendo || 22 || \u00c9l canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Pay takirqam",p1);  //Estamos viviendo || 23 || \u00c9l cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Pay takinqa",p1);  //Estamos viviendo || 24 || \u00c9l cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Pay takichkan/takin",p1);  //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Pay takirqam",p1);  //Estamos viviendo || 26 || Ella cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Pay takinqa",p1);  //Estamos viviendo || 27 || Ella cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"\u00d1uqanchik takinchik",p1);  //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"\u00d1uqanchik takirqanchik",p1);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"\u00d1uqanchik takisunchik",p1);  //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Qamkuna takichkankichik",p1);  //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Qamkuna takirqankichik",p1);  //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Qamkuna takinkichik",p1);  //Estamos viviendo || 33 || Ustedes cantar\u00e1n
            j=1;
          }
          //////////////////////////////////////////
          activity = 88;
          break;
        case 15:   //Submen\u00fa Quechua || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              //if(i<10){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i+3)+".png");
              //}
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+70)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_file[i++],false,"Mallki",p1);  //Madre tierra || 34 || \u00c1rbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_file[i++],false,"Mayu",p1);  //Madre tierra || 35 || R\u00edo 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_file[i++],false,"Phuyu",p1);  //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_file[i++],false,"Para",p1);  //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_file[i++],false,"Wasi",p1);  //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_file[i++],false,"Mikhuna",p1);  //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_file[i++],false,"Inti",p1);  //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_file[i++],false,"Killa",p1);  //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_file[i++],false,"Ch\u2019aska",p1);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_file[i++],false,"Nina",p1);  //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 109;
          break;
        case 16:   //Submen\u00fa Quechua || Animales
          activity = 114;
          break;
        case 17:   //Submen\u00fa Quechua || Abecedario
          activity = 117;
          break;
        case 18:   //Submen\u00fa Shipibo || Salud\u00e1ndonos
        ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[3]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[3]+str(i)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Ointa/Jowe",p1);  //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Jaweskarin/Ointa chan",p1);  //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Kabanon",p1);  //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Jeje(hombre)/jojo(mujer)",p1);  //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Jaskara",p1);  //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Jaskarama",p1);  //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 119;
          break;
        case 19:   //Submen\u00fa Shipibo || Conoci\u00e9ndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[3]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[3]+str(i+6)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfJawe janerin mia?",p1);  //Conoci\u00e9ndonos || 6 || \u00bfCu\u00e1l es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Nokon janeriki ___",p1);  //Conoci\u00e9ndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfJaweti baritianri mia?",p1);  //Conoci\u00e9ndonos || 8 || \u00bfCu\u00e1ntos a\u00f1os tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Eariki ___ baritia",p1);  //Conoci\u00e9ndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfJawerato jemankoniarin mia?",p1);  //Conoci\u00e9ndonos || 10 || \u00bfDe d\u00f3nde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Eariki ___",p1);  //Conoci\u00e9ndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfJawerano jaarin mia?",p1);  //Conoci\u00e9ndonos || 12 || \u00bfD\u00f3nde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Eara jake ___",p1);  //Conoci\u00e9ndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfJawerano kairin mia?",p1);  //Conoci\u00e9ndonos || 14 || \u00bfA d\u00f3nde est\u00e1s yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Eara kai ___",p1);  //Conoci\u00e9ndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 122;
          break;
        case 20:   //Submen\u00fa Shipibo || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[3]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[3]+str(i+16)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Eara bewai",p1);  //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Eara bewake",p1);  //Estamos viviendo || 17 || To cant\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Eara bewai kai",p1);  //Estamos viviendo || 18 || Yo cantar\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Miara bewai",p1);  //Estamos viviendo || 19 || T\u00fa cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Miara bewake",p1);  //Estamos viviendo || 20 || T\u00fa cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Miara bewai kai",p1);  //Estamos viviendo || 21 || T\u00fa cantar\u00e1s
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Oara bewai",p1);  //Estamos viviendo || 22 || \u00c9l canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Oara bewake",p1);  //Estamos viviendo || 23 || \u00c9l cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Oara bewai kai",p1);  //Estamos viviendo || 24 || \u00c9l cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Oa ainbora bewai",p1);  //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Oa ainbora bewake",p1);  //Estamos viviendo || 26 || Ella cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Oa ainbora bewai kai",p1);  //Estamos viviendo || 27 || Ella cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Noabora bewai",p1);  //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Noabora bewake",p1);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Noabora bewai kai",p1);  //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Matora bewai",p1);  //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Matora bewake",p1);  //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Matora bewai kai",p1);  //Estamos viviendo || 33 || Ustedes cantar\u00e1n
            j=1;
          }
          //////////////////////////////////////////
          activity = 127;
          break;
        case 21:   //Submen\u00fa Shipibo || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              //if(i<10){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i+3)+".png");
              //}
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+70)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_file[i++],false,"Jiwi niibo",p1);  //Madre tierra || 34 || \u00c1rbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_file[i++],false,"Paro",p1);  //Madre tierra || 35 || R\u00edo 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_file[i++],false,"Nai koin",p1);  //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_file[i++],false,"Oi",p1);  //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_file[i++],false,"Xobo",p1);  //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_file[i++],false,"Piti",p1);  //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_file[i++],false,"Bari",p1);  //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_file[i++],false,"Oxe",p1);  //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_file[i++],false,"Wishtinbo",p1);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_file[i++],false,"Chi\u00ed tiri",p1);  //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 148;
          break;
        case 22:   //Submen\u00fa Shipibo || Animales
          activity = 153;
          break;
        case 23:   //Submen\u00fa Shipibo || Abecedario
          activity = 156;
          break;
        case 24:   //Submen\u00fa Matsiguenka || Salud\u00e1ndonos
          ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[4]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[4]+str(i)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Og\u00e1/Oga ai\u00f1ovi",p1);  //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Je\u2019je/neje ai\u00f1ona",p1);  //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Atana/noatavaeta",p1);  //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Nani",p1);  //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Jeje",p1);  //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Tera/Gara",p1);  //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 158;
          break;
        case 25:   //Submen\u00fa Matsiguenka || Conoci\u00e9ndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[4]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[4]+str(i+6)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfTrara pipaita?",p1);  //Conoci\u00e9ndonos || 6 || \u00bfCu\u00e1l es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naro novairo onti ___",p1);  //Conoci\u00e9ndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfAkati pishiriagakotanaka?",p1);  //Conoci\u00e9ndonos || 8 || \u00bfCu\u00e1ntos a\u00f1os tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Naro noshiriagakotanaka ___ shiriagarini",p1);  //Conoci\u00e9ndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfTyara piponiaka?",p1);  //Conoci\u00e9ndonos || 10 || \u00bfDe d\u00f3nde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Naro noponiaka ___",p1);  //Conoci\u00e9ndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfTyara pitimi?",p1);  //Conoci\u00e9ndonos || 12 || \u00bfD\u00f3nde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Naro notimi ___",p1);  //Conoci\u00e9ndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfTyara piatanake?",p1);  //Conoci\u00e9ndonos || 14 || \u00bfA d\u00f3nde est\u00e1s yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Noatanake anta ___",p1);  //Conoci\u00e9ndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 161;
          break;
        case 26:   //Submen\u00fa Matsiguenka || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[4]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[4]+str(i+16)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Naro nomatikake",p1);  //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Naro nomatikakiti",p1);  //Estamos viviendo || 17 || To cant\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Naro nomatikakerookari",p1);  //Estamos viviendo || 18 || Yo cantar\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Viro pimatikake",p1);  //Estamos viviendo || 19 || T\u00fa cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Viro pimatikakiti",p1);  //Estamos viviendo || 20 || T\u00fa cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Viro pimatikakerookari",p1);  //Estamos viviendo || 21 || T\u00fa cantar\u00e1s
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Iriro imatikake",p1);  //Estamos viviendo || 22 || \u00c9l canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Iriro imatikakiti",p1);  //Estamos viviendo || 23 || \u00c9l cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Iriro imatikakerookari",p1);  //Estamos viviendo || 24 || \u00c9l cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Irorori omatikake",p1);  //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Irorori omatikakiti",p1);  //Estamos viviendo || 26 || Ella cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Irorori omatikakerookari",p1);  //Estamos viviendo || 27 || Ella cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Naroegi nomatikaigake",p1);  //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Naroegi nomatikaigakiti",p1);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Naroegi nomatikaigakerookari",p1);  //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Viroegi pimatikaigake",p1);  //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Viroegi pimatikaigakiti",p1);  //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Viroegi pimatikaigakerookari",p1);  //Estamos viviendo || 33 || Ustedes cantar\u00e1n
            j=1;
          }
          //////////////////////////////////////////
          activity = 166;
          break;
        case 27:   //Submen\u00fa Matsiguenka || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              //if(i<10){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i+3)+".png");
              //}
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+70)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_file[i++],false,"Inchato/inkenishi",p1);  //Madre tierra || 34 || \u00c1rbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_file[i++],false,"Eni",p1);  //Madre tierra || 35 || R\u00edo 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_file[i++],false,"Menkori",p1);  //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_file[i++],false,"Inkani",p1);  //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_file[i++],false,"Pankotsi",p1);  //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_file[i++],false,"Sekatsi",p1);  //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_file[i++],false,"Poreatsiri",p1);  //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_file[i++],false,"Kashiri",p1);  //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_file[i++],false,"Impokiro/impokiropage",p1);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_file[i++],false,"Morekari",p1);  //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 187;
          break;
        case 28:   //Submen\u00fa Matsiguenka || Animales
          activity = 192;
          break;
        case 29:   //Submen\u00fa Matsiguenka || Abecedario
          activity = 195;
          break;
        case 30:   //Submen\u00fa Yine || Salud\u00e1ndonos
          ///////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<6;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[5]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[5]+str(i)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Galu/wiwi",p1);  //Saludandonos || 0 || Hola || Saludo
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Galu",p1);  //Saludandonos || 1 || Hola || Respuesta
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"Nyatka",p1);  //Saludandonos || 2 || Chau || Despedida
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Gowu",p1);  //Saludandonos || 3 || Chau || Respuesta de despedida
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],false,"Gigi",p1);  //Saludandonos || 4 || Si
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],false,"Gike",p1);  //Saludandonos || 5 || No
            j=1;
          }
          ///////////////////////////////////////////
          activity = 197;
          break;
        case 31:   //Submen\u00fa Yine || Conoci\u00e9ndonos
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[5]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[5]+str(i+6)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfKlu giwakyi?",p1);  //Conoci\u00e9ndonos || 6 || \u00bfCu\u00e1l es tu nombre?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Ngiwakni ___",p1);  //Conoci\u00e9ndonos || 7 || Mi nombre es
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfGipejnu walapu wanenyi?",p1);  //Conoci\u00e9ndonos || 8 || \u00bfCu\u00e1ntos a\u00f1os tienes?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Pamyomole walapu wanenyno",p1);  //Conoci\u00e9ndonos || 9 || Yo tengo
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[1],jaqaru_file[i++],true,"\u00bfGinakgajeryi?",p1);  //Conoci\u00e9ndonos || 10 || \u00bfDe d\u00f3nde eres?
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[0],jaqaru_file[i++],true,"Miariya gajerno gita",p1);  //Conoci\u00e9ndonos || 11 || Yo soy de 
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfGinaka pwa?",p1);  //Conoci\u00e9ndonos || 12 || \u00bfD\u00f3nde vives? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Gawaka sreta wa gita",p1);  //Conoci\u00e9ndonos || 13 || Yo vivo en
            contenidoButtons[i] = new ImageButtons(i,0,0,jaqaru_base[0],jaqaru_file[i++],true,"\u00bfGinaka pyamta?",p1);  //Conoci\u00e9ndonos || 14 || \u00bfA d\u00f3nde est\u00e1s yendo? 
            contenidoButtons[i] = new ImageButtons(i,0,1,jaqaru_base[1],jaqaru_file[i++],true,"Jiryegi nyamta",p1);  //Conoci\u00e9ndonos || 15 || Estoy yendo a
            j=1;
          }
          //////////////////////////////////////////
          activity = 200;
          break;
        case 32:   //Submen\u00fa Yine || Estamos viviendo
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<18;i++){
              if(i<3){
                jaqaru_base[i]=loadImage(lenguas[5]+"_base"+str(i)+".png");
              }
              jaqaru_file[i]=loadImage(lenguas[5]+str(i+16)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Nshikalewata",p1);  //Estamos viviendo || 16 || Yo canto 
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Nshikalwanata",p1);  //Estamos viviendo || 17 || To cant\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Nshikalwatanu",p1);  //Estamos viviendo || 18 || Yo cantar\u00e9
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Pshikalwatanu",p1);  //Estamos viviendo || 19 || T\u00fa cantas
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Pshikalewanata",p1);  //Estamos viviendo || 20 || T\u00fa cantaste
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Pshikalewatanu",p1);  //Estamos viviendo || 21 || T\u00fa cantar\u00e1s
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Wale shikalwata",p1);  //Estamos viviendo || 22 || \u00c9l canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Wale shikalewatatka",p1);  //Estamos viviendo || 23 || \u00c9l cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Wale shikalewatanu",p1);  //Estamos viviendo || 24 || \u00c9l cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Wala shikalwata",p1);  //Estamos viviendo || 25 || Ella canta
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Wala shikalewanata",p1);  //Estamos viviendo || 26 || Ella cant\u00f3
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Wala shikalewatanu",p1);  //Estamos viviendo || 27 || Ella cantar\u00e1
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Wixa shikalwata",p1);  //Estamos viviendo || 28 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Wixa shikalwanata",p1);  //Estamos viviendo || 29 || Nosotros cantamos
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Wixa shikalewatanu",p1);  //Estamos viviendo || 30 || Nosotros cantaremos
            contenidoButtons[i] = new ImageButtons(i,1,0,jaqaru_base[0],jaqaru_file[i++],false,"Gixa shikalewata",p1);  //Estamos viviendo || 31 || Ustedes cantan
            contenidoButtons[i] = new ImageButtons(i,1,1,jaqaru_base[1],jaqaru_file[i++],false,"Gixa shikalewanata",p1);  //Estamos viviendo || 32 || Ustedes cantaron
            contenidoButtons[i] = new ImageButtons(i,1,2,jaqaru_base[2],jaqaru_file[i++],false,"Gixa shikalewatanu",p1);  //Estamos viviendo || 33 || Ustedes cantar\u00e1n
            j=1;
          }
          //////////////////////////////////////////
          activity = 205;
          break;
        case 33:   //Submen\u00fa Yine || Madre tierra
          //////////////////////////////////////////
          j=0;
          if(j==0){
            for(int i=0;i<10;i++){
              //if(i<10){
                jaqaru_base[i]=loadImage(lenguas[1]+"_base"+str(i+3)+".png");
              //}
              jaqaru_file[i]=loadImage(lenguas[1]+str(i+70)+".png");
              
              p1.setMediaFile("vacio.mp3"); 
              p1.setLooping(false); 
              p1.setVolume(1.0f, 1.0f);
            }
            int i=0;
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[0],jaqaru_file[i++],false,"Kashegiru",p1);  //Madre tierra || 34 || \u00c1rbol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[1],jaqaru_file[i++],false,"Tsruru",p1);  //Madre tierra || 35 || R\u00edo 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[2],jaqaru_file[i++],false,"Kamkolu",p1);  //Madre tierra || 34 || Nubes
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[3],jaqaru_file[i++],false,"Gina",p1);  //Madre tierra || 35 || Lluvia
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[4],jaqaru_file[i++],false,"Panchi",p1);  //Madre tierra || 34 || Casa
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[5],jaqaru_file[i++],false,"Niikaluru",p1);  //Madre tierra || 35 || Comida
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[6],jaqaru_file[i++],false,"Tkachi",p1);  //Madre tierra || 34 || Sol
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[7],jaqaru_file[i++],false,"Ksuru",p1);  //Madre tierra || 35 || Luna 
            contenidoButtons[i] = new ImageButtons(i,2,0,jaqaru_base[8],jaqaru_file[i++],false,"Katagiri",p1);  //Madre tierra || 34 || Estrellas
            contenidoButtons[i] = new ImageButtons(i,2,1,jaqaru_base[9],jaqaru_file[i++],false,"Katalu",p1);  //Madre tierra || 35 || Fuego 
            j=1;
          }
          //////////////////////////////////////////
          activity = 226;
          break;
        case 34:   //Submen\u00fa Yine || Animales
          activity = 231;
          break;
        case 35:   //Submen\u00fa Yine || Abecedario
          activity = 234;
          break;
      }
    }
  }
 
  public void display() {
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
    text(SUBMENU, PApplet.parseInt(x+min_x*1.5f), PApplet.parseInt(y+min_y));
    textSize(altoGlobal/28);
    text(submenu, PApplet.parseInt(x+min_x*1.5f), PApplet.parseInt(y+min_y*1.5f));
  }
  
  public void over(){
    if( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }
 
}

  public int sketchWidth() { return displayWidth; }
  public int sketchHeight() { return displayHeight; }
}
