ArrayList<Cereals> clist = new ArrayList<Cereals>();
float[] menunumbers = new float[4];
boolean menu;

  int one=1;
  int two=2;
  int graph=3;
  int readme=4;

void setup()
{
  size(600,600);
  background(0);
  loaddata();
  menu = true;
 
  one=1;
  two=2;
  graph=3;
  readme=4;
  
}

void draw()
{
  if(menu)
  {
    loadmenu();
  }
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
  translate(width/2,height/2);
  
  
  
  ellipse(menunumbers[one%4],0,circled,circled);
  fill(255,0,0);
  ellipse(menunumbers[two%4],0,circled,circled);
  fill(0,255,0);
  ellipse(menunumbers[graph%4],0,circled,circled);
  fill(0,0,255);
  ellipse(menunumbers[readme%4],0,circled,circled);
  fill(255);
 
  
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
    
  
 void mousePressed()
 {
   if(menu)
   {
     
       one++;
       two++;
       graph++;
       readme++;
     
   }
   
 }