/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void fileText_change(GTextArea source, GEvent event) { //_CODE_:fileText:309522:


} //_CODE_:fileText:309522:

public void loadFile_click(GButton source, GEvent event) { //_CODE_:loadFile:525488:
if (event == GEvent.CLICKED) {
  selectInput("Load a Ring Tone File" , "fileSelected");
}
} //_CODE_:loadFile:525488:

public void fileName_change(GTextField source, GEvent event) { //_CODE_:fileName:232974:
  println("fileName - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:fileName:232974:

public void resetFileButton_click(GButton source, GEvent event) { //_CODE_:resetFileButton:335769:
if (event == GEvent.CLICKED) {
  fileSelected(fileSelected);
  
}
  
} //_CODE_:resetFileButton:335769:

public void testPlay_click(GButton source, GEvent event) { //_CODE_:testPlay:490193:
if (event == GEvent.CLICKED) {
  playSong();
}

} //_CODE_:testPlay:490193:

public void defDuration_change(GTextField source, GEvent event) { //_CODE_:defDuration:324526:
 
} //_CODE_:defDuration:324526:

public void defOctive_change(GTextField source, GEvent event) { //_CODE_:defOctive:240427:

} //_CODE_:defOctive:240427:

public void defBPM_change(GTextField source, GEvent event) { //_CODE_:defBPM:685057:
  
} //_CODE_:defBPM:685057:

public void accelerationVal_change1(GTextField source, GEvent event) { //_CODE_:accelerationVal:809692:

} //_CODE_:accelerationVal:809692:

public void velocityVal_change(GTextField source, GEvent event) { //_CODE_:velocityVal:888101:

} //_CODE_:velocityVal:888101:

public void generateGCode_click(GButton source, GEvent event) { //_CODE_:generategCode:364176:
if (event == GEvent.CLICKED) {
generategCode();
}
} //_CODE_:generategCode:364176:

public void gCodeText_change1(GTextArea source, GEvent event) { //_CODE_:gCodeText:703802:

} //_CODE_:gCodeText:703802:

public void copygCode_click(GButton source, GEvent event) { //_CODE_:writegCode:223029:
String[]finalgCode = outputGcode.array();
String str =  join(finalgCode, "\n");
GClip.copy(str);
} //_CODE_:writegCode:223029:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  fileText = new GTextArea(this, 14, 51, 495, 182, G4P.SCROLLBARS_VERTICAL_ONLY | G4P.SCROLLBARS_AUTOHIDE);
  fileText.setOpaque(true);
  fileText.addEventHandler(this, "fileText_change");
  loadFile = new GButton(this, 13, 15, 67, 26);
  loadFile.setText("Load File");
  loadFile.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  loadFile.addEventHandler(this, "loadFile_click");
  fileName = new GTextField(this, 85, 15, 427, 25, G4P.SCROLLBARS_NONE);
  fileName.setPromptText("No File Loaded");
  fileName.setOpaque(true);
  fileName.addEventHandler(this, "fileName_change");
  resetFileButton = new GButton(this, 13, 239, 127, 30);
  resetFileButton.setText("Reset Defaults from File");
  resetFileButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  resetFileButton.addEventHandler(this, "resetFileButton_click");
  testPlay = new GButton(this, 16, 413, 293, 30);
  testPlay.setText("Have a Listen");
  testPlay.addEventHandler(this, "testPlay_click");
  defDuration = new GTextField(this, 146, 281, 160, 30, G4P.SCROLLBARS_NONE);
  defDuration.setOpaque(true);
  defDuration.addEventHandler(this, "defDuration_change");
  defDurationLabel = new GLabel(this, 15, 282, 127, 20);
  defDurationLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  defDurationLabel.setText("Default Duration");
  defDurationLabel.setOpaque(false);
  defOctiveLabel = new GLabel(this, 16, 322, 122, 20);
  defOctiveLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  defOctiveLabel.setText("Default Octive");
  defOctiveLabel.setOpaque(false);
  defOctive = new GTextField(this, 146, 321, 160, 30, G4P.SCROLLBARS_NONE);
  defOctive.setOpaque(true);
  defOctive.addEventHandler(this, "defOctive_change");
  defBPM = new GTextField(this, 147, 367, 160, 30, G4P.SCROLLBARS_NONE);
  defBPM.setOpaque(true);
  defBPM.addEventHandler(this, "defBPM_change");
  defBPMLabel = new GLabel(this, 16, 366, 125, 20);
  defBPMLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  defBPMLabel.setText("Default BPM");
  defBPMLabel.setOpaque(false);
  accelerationVal = new GTextField(this, 661, 10, 160, 30, G4P.SCROLLBARS_NONE);
  accelerationVal.setText("30000");
  accelerationVal.setOpaque(true);
  accelerationVal.addEventHandler(this, "accelerationVal_change1");
  velocityVal = new GTextField(this, 949, 10, 160, 30, G4P.SCROLLBARS_NONE);
  velocityVal.setText("2000");
  velocityVal.setOpaque(true);
  velocityVal.addEventHandler(this, "velocityVal_change");
  label1 = new GLabel(this, 527, 12, 125, 19);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Acceleration");
  label1.setOpaque(false);
  label2 = new GLabel(this, 828, 11, 110, 19);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Max Velocity");
  label2.setOpaque(false);
  generategCode = new GButton(this, 331, 379, 178, 63);
  generategCode.setText("Generate gCode");
  generategCode.addEventHandler(this, "generateGCode_click");
  gCodeText = new GTextArea(this, 526, 54, 606, 332, G4P.SCROLLBARS_VERTICAL_ONLY | G4P.SCROLLBARS_AUTOHIDE);
  gCodeText.setOpaque(true);
  gCodeText.addEventHandler(this, "gCodeText_change1");
  copygCode = new GButton(this, 1019, 395, 113, 47);
  copygCode.setText("Copy gCode");
  copygCode.addEventHandler(this, "copygCode_click");
}

// Variable declarations 
// autogenerated do not edit
GTextArea fileText; 
GButton loadFile; 
GTextField fileName; 
GButton resetFileButton; 
GButton testPlay; 
GTextField defDuration; 
GLabel defDurationLabel; 
GLabel defOctiveLabel; 
GTextField defOctive; 
GTextField defBPM; 
GLabel defBPMLabel; 
GTextField accelerationVal; 
GTextField velocityVal; 
GLabel label1; 
GLabel label2; 
GButton generategCode; 
GTextArea gCodeText; 
GButton copygCode; 