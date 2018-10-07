// Need G4P library
import g4p_controls.*;

File fileSelected; 
import processing.sound.*;
  
StringList outputGcode;

Table loc;
TriOsc   saw;
/* 0 - P - rest or pause
 1 - C
 2 - C# 
 3 - D 
 4 - D# 
 5 - E 
 6 - F 
 7 - F# 
 8 - G 
 9 - G# 
 10 - A 
 11 - A# 
 12 - B 
 */
//format note
float noteFrequency[][] = {
  {0, 0, 0, 0}, 
  {261.626, 523.251, 1046.50, 2093.01}, 
  {277.183, 554.365, 1108.73, 2217.46}, 
  {293.665, 587.33, 1174.66, 2349.32}, 
  {311.127, 622.254, 1244.51, 2489.02}, 
  {329.628, 659.255, 1318.510, 2637.02}, 
  {349.228, 698.456, 1396.91, 2793.83}, 
  {369.994, 739.989, 1479.98, 2959.96}, 
  {391.995, 783.991, 1567.982, 3135.96}, 
  {415.305, 830.609, 1661.22, 3322.44}, 
  {440, 880.000, 1760.00, 3520}, 
  {466.164, 932.328, 1864.66, 3729}, 
  {493.883, 987.767, 1975.53, 3951}
};

String[] test2 = {"1"};
public void setup() {
outputGcode = new StringList();






  loc=loadTable("strikerlocations.csv", "header");
  size(1400, 600, JAVA2D);
  createGUI();
  customGUI();
  saw = new TriOsc (this);
  
  
  
  // Place your setup code here
}

public void draw() {
  background(230);

}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {

  fileName.setEnabled(false);
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    String[] lines = loadStrings(selection.getAbsolutePath());

    if (lines.length == 1 ) {
      fileSelected = selection;
      int firstColon = lines[0].indexOf(":", 0);
      fileName.setText(trim(lines[0].substring(0, firstColon))); 
      int secondColon = lines[0].indexOf(":", firstColon+1);
      String[] settings = trim(split(trim(lines[0].substring(firstColon+1, secondColon)), ","));


      defOctive.setText(settings[1].substring(2));

      defBPM.setText(settings[2].substring(2));


      defDuration.setText(settings[0].substring(2));

      String[] notes = trim(split(trim(lines[0].substring(secondColon+1)), ","));
      fileText.setText(notes) ;
    }
  }
}




void playSong () {



  int wholeNote = (60 * 1000 / int(defBPM.getText())) * 4;
  int defDur = wholeNote/int(defDuration.getText());
  int defOct = int(defOctive.getText());
  String[] notes = fileText.getTextAsArray();
  int n = 0; 
  while (mousePressed == false || n < notes.length) {

    
    
    /*fileText.clearStyles();
     fileText.addStyle(G4P.BACKGROUND, new Color(0, 0, 128), n, 0, 100);
     fileText.addStyle(G4P.FOREGROUND, new Color(255, 255, 255), n, 0, 100);
     */

    int noteDuration;
    int notePitch =0;
    int noteOctive=defOct;
    int noteLoc; 
    int octLoc; 
    boolean noteIsDotted = false;




    if (Character.isDigit(notes[n].charAt(0))) {
      if (Character.isDigit(notes[n].charAt(1))) {
        noteDuration = wholeNote/ (Character.getNumericValue(notes[n].charAt(0))*10 +  Character.getNumericValue(notes[n].charAt(1)));

        //  println(noteDuration);
        noteLoc =2;
      } else {
        noteDuration = wholeNote/(Character.getNumericValue(notes[n].charAt(0)));
        //  println(noteDuration);
        noteLoc=1;
      }
    } else {
      noteDuration = defDur;
      noteLoc=0;
    }
    switch (notes[n].toUpperCase().charAt(noteLoc)) {
    case 'P': 
      notePitch = 0;
      break;
    case 'C': 
      notePitch = 1;
      break;
    case 'D': 
      notePitch = 3;
      break;
    case 'E': 
      notePitch = 5;
      break;
    case 'F': 
      notePitch = 6;
      break;
    case 'G': 
      notePitch = 8;
      break;
    case 'A': 
      notePitch = 10;
      break;
    case 'B': 
      notePitch = 12;
      break;
    case 'H': 
      notePitch = 12;
      break;



      /* 0 - P - rest or pause
       1 - C
       2 - C# 
       3 - D 
       4 - D# 
       5 - E 
       6 - F 
       7 - F# 
       8 - G 
       9 - G# 
       10 - A 
       11 - A# 
       12 - B 
       */
    }

    if (noteLoc < notes[n].length()-1) {
      octLoc = noteLoc+1;
      if (notes[n].charAt(noteLoc+1)=='#') {
        notePitch++;
        octLoc++;
      }

      if (octLoc < notes[n].length()) {
        if (Character.isDigit(notes[n].charAt(octLoc))) {
          noteOctive = Character.getNumericValue(notes[n].charAt(octLoc));
        } else { 
          noteOctive = defOct;
        }
      }
    }

    if (notes[n].indexOf(".") != -1)
    {
      noteIsDotted = true;
      noteDuration += noteDuration/2;
    }
    println(notes[n] + " Duration: " +noteDuration + " Pitch: " + notePitch + " Octive:" +noteOctive + " Is Dotted: " + noteIsDotted + " Note #:" + (notePitch +((noteOctive-4)*12)));

    







    saw.freq(noteFrequency[notePitch][noteOctive-4]);
    saw.play();
   if (noteDuration > 100) {
     
    delay(noteDuration-100);
    
    saw.stop();
        delay(100);
   }else {
      delay(noteDuration);
    
    saw.stop();}
    redraw();

  n++;
}
}