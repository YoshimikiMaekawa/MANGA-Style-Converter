/*
 #prease, input original picture's name in line input_name.
 #prease, input save picture's name in line output_name.
 #please, input original picture's size in size() in line 26.
 #if it is difficlut to understand the border, please rise border_in.
 #this syastem is cover by 3992×1908
 */

int border_in=10;//border's level

String input_name="./originalImages/toyamaStation.JPG";//input name
String output_name="./mangaStyleImages/manga_toyamaStation.png";//output name
String output_color_name="./colorMangaStyleImages/manga_color_toyamaStation.png";//output name

//to make border
PImage original, original_edge, original_rev_gray, original_border, original_rev, output;

//to make comic affected image
PImage original_gray, original_comic;

//to make color comic version
PImage original_posturize;
PImage output_color;

//tone images
PImage tone1, tone2, tone3;

//now, ready each PImage to confirm which function is bad

void setup() {
  size(3840, 2160); //set const. width and height!!!
  noStroke();
  smooth();
  
  //set the PImage #finish
  original=loadImage(input_name);
  original_edge=createImage(original.width, original.height, RGB);
  original_rev_gray=createImage(original.width, original.height, RGB);
  original_border=createImage(original.width, original.height, RGB);
  original_rev=createImage(original.width, original.height, RGB);
  original_gray=createImage(original.width, original.height, RGB);
  original_comic=createImage(original.width, original.height, RGB);
  original_posturize=createImage(original.width, original.height, RGB);

  tone1=loadImage("./tones/tone1.jpg");
  tone2=loadImage("./tones/tone2.jpg");
  tone3=loadImage("./tones/tone3.jpg");
  output=createImage(original.width, original.height, RGB);
  output_color=createImage(original.width, original.height, RGB);

  //make border image
  edge(original, original_edge); //get the edge
  rev(original_edge, original_rev); //edge become black line and contrasted
  gray(original_rev, original_rev_gray);
  border(original_rev_gray, original_border);

  //make manga image
  gray(original, original_gray);
  comic_effect(original_gray, original_comic);
  
  //make color manga image
  original_posturize=original;
  original_posturize.filter(POSTERIZE,5);

  //merge border and manga images
  multi(original_comic, original_border, output); //multiple 2 PImage's pixels
  image(output, 0, 0); //output image
  output.save(output_name);
  
  //merge border and color manga image and tone image
  multi(output,original_posturize,output_color); //get colored comic image
  output_color.save(output_color_name);
}

//get the edge #finish
void edge(PImage input, PImage output) {
  float dx;
  float dy;
  float d;
  for (int y = 1; y < input.height-1; y++) { 
    for (int x = 1; x < input.width-1; x++) {
      dx = - get_ave(input, x-1, y-1) - 2*get_ave(input, x-1, y) - get_ave(input, x-1, y+1) + get_ave(input, x+1, y-1) + 2*get_ave(input, x+1, y) + get_ave(input, x+1, y+1);
      dy = - get_ave(input, x-1, y-1) - 2*get_ave(input, x, y-1) - get_ave(input, x+1, y-1) + get_ave(input, x-1, y+1) + 2*get_ave(input, x, y+1) + get_ave(input, x+1, y+1);
      d = sqrt(pow(dx, 2) + pow(dy, 2));
      output.set(x, y, color(abs(d)));
    }
  }
}

//reverse and contrasting #finish
void rev(PImage input, PImage output) {
  for (int y = 1; y < input.height-1; y++) { 
    for (int x = 1; x < input.width-1; x++) {
      float r=red(input.pixels[x+y*width]);
      float g=green(input.pixels[x+y*width]);
      float b=blue(input.pixels[x+y*width]);
      output.set(x, y, color(255-r, 255-g, 255-b));
    }
  }
}

//multiply 2 image's pixels #finish
void multi(PImage input, PImage rev, PImage output) {
  for (int y=0; y<input.height; y++) {
    for (int x=0; x<input.width; x++) {
      float r1=red(input.pixels[x+y*width]);
      float r2=red(rev.pixels[x+y*width]);
      float g1=green(input.pixels[x+y*width]);
      float g2=green(rev.pixels[x+y*width]);
      float b1=blue(input.pixels[x+y*width]);
      float b2=blue(rev.pixels[x+y*width]);

      float r3=r1*r2/255;
      float g3=g1*g2/255;
      float b3=b1*b2/255;

      output.set(x, y, color(r3, g3, b3));
    }
  }
}

//get gray pixels #finish
void gray(PImage input, PImage output) {
  for (int y=0; y<input.height; y++) {
    for (int x=0; x<input.width; x++) {
      float r=red(input.pixels[x+y*width]);
      float g=green(input.pixels[x+y*width]);
      float b=blue(input.pixels[x+y*width]);
      float gray=0.2126*r+0.7152*g+0.0722*b; //cf:wikipedia
      output.set(x, y, color(gray, gray, gray));
    }
  }
}

//get contrasted border (afect after gray function!!) #finish
void border(PImage input, PImage output) {
  int border=border_in; //it defines border's contrast
  for (int y=0; y<input.height; y++) {
    for (int x=0; x<input.width; x++) {
      float gray=red(input.pixels[x+y*width]);
      if (gray<border) {
        output.set(x, y, color(0, 0, 0));//this defines border's color
      } else {
        output.set(x, y, color(255, 255, 255));
      }
    }
  }
}

//get comic-affected image (afect after gray function!!) #finish
void comic_effect(PImage input, PImage output) {
  for (int y=0; y<input.height; y++) {
    for (int x=0; x<input.width; x++) {
      float gray=red(input.pixels[x+y*width]);
      if (gray<=51) {
        output.set(x, y, color(50, 50, 50));
      } else if (51<gray && gray<=102) {
        output.set(x, y, tone2.pixels[x+y*width]);
      } else if (102<gray && gray<=153) {
        output.set(x, y, tone1.pixels[x+y*width]);
      } else if (152<gray && gray<=204) {
        output.set(x, y, tone3.pixels[x+y*width]);
      } else if (204<gray && gray<=255) {
        output.set(x, y, color(255, 255, 255));
      }
    }
  }
}

//get rgb's average #finish
float get_ave(PImage input, int x, int y) {
  float ret;
  ret=(0.2126*red(input.get(x, y))+0.7152*green(input.get(x, y))+0.0722*blue(input.get(x, y)))/3;
  return ret;
}