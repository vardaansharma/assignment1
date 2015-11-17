ArrayList<Cereals> clist = new ArrayList<Cereals>();
boolean menu;

void setup()
{
  size(600,600);
  background(0);
  loaddata();
  menu = true;
  
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
  background(0);
  translate(width/2,height/2);
  ellipse(0,0,180,180);
 
  
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
    
  
 