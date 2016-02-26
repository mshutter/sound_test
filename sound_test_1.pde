//sound instantiation
import processing.sound.*;
SoundFile note;

//controlP5 instantiation
import controlP5.*;
ControlP5 cp5;

//array of available notes
String[] notes = {
  "C3", "C#3", "D3", "D#3",
  "E3", "F3", "F#3", "G3",
  "G#3", "A3", "A#3", "B3",
  "C4"
};

//cp5 vars
int myColor = color(255);
int c1,c2;
float n,n1;

void setup() {
  size(300,600);
  noStroke();
  cp5 = new ControlP5(this);
  
  for (int i = 0; i < notes.length; i++) {
    cp5.addButton(notes[i])
      .setValue(i)
      .setPosition(10 + (i*20), 10)
      .setSize(19,80)
      ;
  }
}

void draw() {
  background(200);
  myColor = lerpColor(c1,c2,n);
  n += (1-n)* 0.1; 
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  note = new SoundFile(this, "piano/" + theEvent.getController().getName() + ".wav");
  note.play();
  n = 0;
}