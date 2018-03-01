import processing.sound.*;


PImage img;
ArrayList<String> imgNames = new ArrayList<String>();
SoundFile file;

int savedTime;
int totalTime = 5000;
int photoStartMark = 0;

void setup() {
  fullScreen();
  //size(720,480);
  String path = sketchPath()+"/data";
  String[] filenames = listFileNames(path);
  //printArray(filenames);
 
  //get all jpg files in data folder
  for (int i = 0; i <= filenames.length - 1; i++){
    if (filenames[i].toLowerCase().endsWith(".jpg")){
      imgNames.add(filenames[i]);
    }
  }  
    
  img = loadImage(imgNames.get(photoStartMark));
  file = new SoundFile(this, "clip.mp3");
  file.loop();
  //println(file.channels());
  savedTime = millis();
  //println(imgNames.size());
}

void draw() {
  imageMode(CENTER);
  background(0);
  
  if(img.width>= img.height){
    //landscape
    img.resize(width,(img.height/img.width)*(width/height));    
  } else{
    //portrait
    img.resize( (img.width/img.height)*(height/img.height), height);
  }
  // Draw the image to the screen according image's center
  image(img, width/2, height/2);
  
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {
    if (photoStartMark < imgNames.size()-1){
      photoStartMark += 1;
    } else {
      photoStartMark = 0;
    }
    img = loadImage(imgNames.get(photoStartMark));
    savedTime = millis();
  }
}


// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

// This function returns all the files in a directory as an array of File objects
// This is useful if you want more info about the file
File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}
