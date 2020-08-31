Blob[] blobs = new Blob[10];
PImage backbuffer;


void setup(){
  int Width = 640;
  int Height = 480;
  size(640, 480);
  backbuffer = createImage(Width,Height,HSB);
  colorMode(HSB);
  //fullScreen();
  for (int i = 0; i < blobs.length; i++){
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw(){
  backbuffer.loadPixels();
  //backbuffer.background(51);
  for (int x = 0; x < width; x++){
   for (int y = 0; y < height; y++){
    int  index = x+y*width;
    float sum = 0;
    for (Blob b:blobs){
      float d = dist(x,y,b.pos.x, b.pos.y);
      sum += 100 * blobs[0].r / d;
    }
    backbuffer.pixels[index] = color(constrain(sum,0,220),255,255);
   } 
  }
  backbuffer.updatePixels();
  image(backbuffer,0,0);
  for (Blob b: blobs){
    b.update();
    //b.show();
  }
}