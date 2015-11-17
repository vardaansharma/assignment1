ArrayList<Cereals> clist = new ArrayList<Cereals>();
int[] menunumbers = new int[4];
boolean menu;

void setup()
{
  size(600,600);
  background(0);
  loaddata();
  menu = true;
  menunumbers[0] = 1;
  menunumbers[1] = 2;
  menunumbers[2] = 3;
  menunumbers[3] = 4;
  
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
  float pos0 = 0;
  float pos1 = circled + xdist;
  float pos2 = (circled +xdist)*2;
  float pos3 = 0-(circled+xdist);
  background(0);
  translate(width/2,height/2);
  
  
  ellipse(pos0,0,circled,circled);
  ellipse(pos1,0,circled,circled);
  ellipse(pos2,0,circled,circled);
  ellipse(pos3,0,circled,circled);
  
 
  
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
    
  
 