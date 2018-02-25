PImage img;  

ArrayList<String> imgNames = new ArrayList<String>();

int savedTime;
int totalTime = 5000;
int photoStartMark = 0;

void setup() {
  //fullScreen();
  size(720,480);
  imgNames.add("057.jpg");
  imgNames.add("058.jpg");
  imgNames.add("059.jpg");
  imgNames.add("060.jpg");
  imgNames.add("061.jpg");
  imgNames.add("062.jpg");
  
  
  img = loadImage(imgNames.get(photoStartMark));
  savedTime = millis();
  println(imgNames.size());
}

void draw() {
  background(0);
  img.resize(width,height);
  // Draw the image to the screen at coordinate (0,0)
  image(img, 0, 0);
  
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) { //<>//
    
    if (photoStartMark < imgNames.size()-1){ //<>//
      photoStartMark += 1;
      println(photoStartMark);
      
    } else {
      photoStartMark = 0;
      println(photoStartMark); //<>//
    }
  
    img = loadImage(imgNames.get(photoStartMark));
    savedTime = millis();
  }
}