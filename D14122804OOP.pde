ArrayList<Cereals> clist = new ArrayList<Cereals>();

float x,y,z;
int segments = 12;
float cx , cy;
float radius;
float smallradius;

void setup()
{
  size(600,600,P3D);
  background(0);
  loaddata();
  
}

void draw() {
 background(0,0,80);
 drawstar();
 drawbox();
}

void loaddata()
{
  String[] data = loadStrings("cereal.csv");
  
  for ( int i =2 ; i <data.length ; ++i)
  {
    Cereals temp = new Cereals(data[i]);
    clist.add(temp);
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
  box(100,150,70);
  popMatrix();
}


void drawstar()
{
  pushMatrix();
  
  translate(width/2,height/2,0);
    
  fill(250,170,0);
  stroke(170,0,0);
  strokeWeight(2);
  radius = 180;
  smallradius = 100;
  
  beginShape();
   for(int i = 0; i < segments; i++)
  {
    float theta;
    theta = ((TWO_PI)/segments * i );
    if(i % 2 == 0){
      x = sin(theta) * radius;
      y = cos(theta) * radius;
      vertex(x,y);
      
    }
    else
    {
      x = sin(theta) * smallradius;
      y = cos(theta) * smallradius;
      vertex(x,y);
      
    }
  }
  endShape(CLOSE);
  popMatrix();
}
 