import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.* ;
import org.jbox2d.dynamics.* ;
import processing.sound.*;
PImage fondo;
PImage vaca;
PImage ovni;
Box2DProcessing mundo;
ArrayList <vaca> vacaca;
ovni ovnim;
SoundFile cancion;

void setup(){
  cancion = new SoundFile(this, "vacamu.mp3" );
  size(1200,800);
  fondo= loadImage("fondo.jpg");
  fondo.resize(1200,800);
  ovni= loadImage("ovni.png"); 
  ovni.resize(400,200);
  vaca= loadImage("vaca.png");
  vaca.resize(150,100);
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  vacaca = new ArrayList<vaca>();
  ovnim = new ovni(500,300,260,90);

}

void draw(){
  image(fondo,0,0);
  mundo.step();
  for(vaca c:vacaca){
    c.display();
  }
  if (mousePressed) {
    vacaca.add(new vaca(mouseX,mouseY,80,50));
    cancion.loop();
  }
  ovnim.display();
}

 
 
