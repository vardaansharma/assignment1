ArrayList<Cereals> clist = new ArrayList<Cereals>(); // array for classe
float[] menunumbers = new float[4]; // array for menu items
boolean menu; // variable for checking if we are at the menu

// variables for menu items
int one=1;
int two=2;
int graph=3;
int readme=4;

// variables for drawing the box and star
float x, y, z;
int segments = 12;
float cx, cy;
float radius;
float smallradius;

//variables for menu choice
boolean callsinglebox;
boolean calldoublebox;
boolean callreadme;
boolean callgraph;

void setup()
{

  size(600, 600, P3D);
  background(0);
  loaddata();
  menu = true
    ;

  //initializing varibales for the menu
  one=1;
  two=2;
  graph=3;
  readme=4;

  //initiliazing the menu calls to no
  callsinglebox = false;
  calldoublebox = false;
  callgraph = false;
  callreadme = false;
}

void draw()
{
  if (menu)
  {
    loadmenu();
  } else
  {
    if (callsinglebox)
    {
      drawstar();
      drawbox();
    }
    if (calldoublebox)
    {
      drawstar();
      drawdoublebox();
    }
  }
  println(mouseX);
  println(mouseY);
}

void loadmenu()
{


  int xdist = 90;
  float circler = 90;
  float circled = circler*2;
  menunumbers[0] = 0;
  menunumbers[1] = circled + xdist;
  menunumbers[2] = (circled +xdist)*2;
  menunumbers[3] = 0-(circled+xdist);
  background(0);
  translate(width/2, height/2);


  pushMatrix();
  translate(0, 0, 60);
  ellipse(menunumbers[one%4], 0, circled, circled);
  translate(menunumbers[one%4], 0, 61);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("single box", 0, 0);

  popMatrix();

  pushMatrix();
  translate(0, 0, 60);
  fill(255, 0, 0);
  ellipse(menunumbers[two%4], 0, circled, circled);
  translate(menunumbers[two%4], 0, 61);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("double box", 0, 0);
  popMatrix();

  pushMatrix();
  translate(0, 0, 60);
  fill(0, 255, 0);
  ellipse(menunumbers[graph%4], 0, circled, circled);
  translate(menunumbers[graph%4], 0, 61);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("graph", 0, 0);
  popMatrix();

  pushMatrix();
  translate(0, 0, 60);
  fill(0, 0, 255);
  ellipse(menunumbers[readme%4], 0, circled, circled);
  translate(menunumbers[readme%4], 0, 61);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("readme", 0, 0);
  popMatrix();
  fill(255);
}



void loaddata()
{
  String[] data = loadStrings("cereal.csv");

  for ( int i =2; i <data.length; ++i)
  {
    Cereals temp = new Cereals(data[i]);
    clist.add(temp);
  }
}



void mousePressed()
{
  translate(height/2, width/2);
  if (menu)
  {

    if ( dist(mouseX, mouseY, height/2, width/2) < 90 )
    {
      if (menunumbers[one%4] == 0)
      {
        menu = !menu;
        callsinglebox = !callsinglebox;
      } else if (menunumbers[two%4] == 0)
      {
        menu=!menu;
        calldoublebox=!calldoublebox;
      }
    } else {
      one++;
      two++;
      graph++;
      readme++;
    }
  }
  else
  {
    if (mouseX > (width-20) && mouseY < 20)
    {
      menu=!menu;
      callsinglebox = false;
      calldoublebox = false;
    }
  }
}

void drawbox()
{
  fill(255);
  float move= 0.0f; 
  pushMatrix();
  translate(width/2, height/2, 120);

  move = mouseX * 0.01;


  rotateY(move);
  rotateX(0);
  stroke(0);
  box(100, 150, 70);
  popMatrix();
  
   fill(86);
  rect(width-20, 0, 20, 20);
  line(width-20,0,width,20);
  line(width,0,width-20,20);
}


void drawstar()
{
  background(0, 0, 80);
  pushMatrix();

  translate(width/2, height/2, 0);

  fill(250, 170, 0);
  stroke(170, 0, 0);
  strokeWeight(2);
  radius = 180;
  smallradius = 100;

  beginShape();
  for (int i = 0; i < segments; i++)
  {
    float theta;
    theta = ((TWO_PI)/segments * i );
    if (i % 2 == 0) {
      x = sin(theta) * radius;
      y = cos(theta) * radius;
      vertex(x, y);
    } else
    {
      x = sin(theta) * smallradius;
      y = cos(theta) * smallradius;
      vertex(x, y);
    }
  }
  endShape(CLOSE);
  popMatrix();
}

void drawdoublebox()
{
  fill(255);
  float move= 0.0f; 
  pushMatrix();
  translate(width/2-80, height/2, 120);

  move = mouseX * 0.01;


  rotateY(move);
  rotateX(0);
  stroke(0);
  box(100, 150, 70);
  popMatrix();


  pushMatrix();
  translate(width/2+100, height/2, 120);

  move = mouseX * 0.01;


  rotateY(move);
  rotateX(0);
  stroke(0);
  box(100, 150, 70);
  popMatrix();

  fill(86);
  rect(width-20, 0, 20, 20);
  line(width-20,0,width,20);
  line(width,0,width-20,20);
}