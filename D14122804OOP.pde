ArrayList<Cereals> clist = new ArrayList<Cereals>(); // array for the cereals class
ArrayList<Sugar> slist = new ArrayList<Sugar>();//array for the sugar class
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
boolean chose;

int cerealnumber;
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
  chose = false;
  
  println(clist.get(3).name);
  println(clist.get(3).fiber);
  println(clist.get(3).sugar);
  println(clist.get(3).fat);
  println(clist.get(3).protein);
  println(clist.get(3).carbs);
}

void draw()
{
  
  
  if (menu)
  {
    loadmenu();
  } 
  else
  {
    if (callsinglebox)
    {
      if(chose)
      {
        drawstar();
        
        Cereals c = new Cereals(clist.get(cerealnumber));
        
        //code to make the exit box
        fill(86);
        rect(width-20, 0, 20, 20);
        line(width-20,0,width,20);
        line(width,0,width-20,20); 
      }
       else
      {
        showcereals();
      }
    }
    else if (calldoublebox)
    {
      drawsugargraph();
    }
    else if (callreadme)
    {
      drawreadme();
    }
    else if (callgraph)
    {
      drawgraph();
    }
     
  }
 
}

void loadmenu()
{

  stroke(0);
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
  text("cereal box", 0, 0);

  popMatrix();

  pushMatrix();
  translate(0, 0, 60);
  fill(255, 0, 0);
  ellipse(menunumbers[two%4], 0, circled, circled);
  translate(menunumbers[two%4], 0, 61);
  fill(0);
  textAlign(CENTER);
  textSize(28);
  text("average\nsugar\nintake", 0, -30);
  popMatrix();

  pushMatrix();
  translate(0, 0, 60);
  fill(0, 255, 0);
  ellipse(menunumbers[graph%4], 0, circled, circled);
  translate(menunumbers[graph%4], 0, 61);
  fill(0);
  textAlign(CENTER);
  textSize(25);
  text("cereal \n vs \n banana", 0, -30);
  popMatrix();

  pushMatrix();
  translate(0, 0, 60);
  fill(0, 0, 255);
  ellipse(menunumbers[readme%4], 0, circled, circled);
  translate(menunumbers[readme%4], 0, 61);
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("click\nme\nfirst", 0, -30);
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

  String[] data1 = loadStrings("sugar.txt");
  
  for( int i = 1; i<data1.length; ++i)
  {
    Sugar t = new Sugar(data1[i]);
    slist.add(t);
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
        
    }
       else if (menunumbers[two%4] == 0)
      {
        menu=!menu;
        calldoublebox=!calldoublebox;
      
      }
      else if (menunumbers[readme%4] == 0)
      {
        menu=!menu;
        callreadme = !callreadme;
        println(callreadme);
      }
      else if (menunumbers[graph%4] == 0)
      {
        menu=!menu;
        callgraph = !callgraph;
        println(callreadme);
      }
      
    }//end of in the circle if
    
    //else statement for changing menu options
    else 
    {
      one++;
      two++;
      graph++;
      readme++;
    }
  }//end of if in menu if 
  else
  {
    if (mouseX > (width-20) && mouseY < 20)
    {
      menu=!menu;
      callsinglebox = false;
      calldoublebox = false;
      callgraph = false;
      callreadme = false;
      chose = false;
    }
  }
}



//function to draw the star behind the boxes
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




//function to draw the graph option
void drawgraph()
{
  
  background(0);
  float border = 40;
  stroke(255);
  line(border,border,border,height-border);
  line(border,height-border,width-border,height-border);
  float hlinesize = height - (2*border);
  float pos = height - border;
  float dist = map(10,0,400,0,hlinesize);
  int num = 0;
  textSize(15);
  fill(255);
  for(int i = 0 ; i < 41 ; ++i, num+=10)
  {
    line(border-10,pos,border,pos);
    text(num, border-25 , pos+(dist/2));
    pos-=dist;
  }
  
  //drawing bar graphs
  float vlinesize = width- (border*2);
  float barwidth = map(1,0,clist.size(),0,vlinesize);
  
  //drawing the banana amount line
  float l = map(290,0,400,0,hlinesize);
  stroke(255,255,0);
  fill(255,255,0);
  textAlign(CENTER,BOTTOM);
  line(border , height - l - border , width-border, height - border - l );
  text("290mg of potassium in a small banana" , width/2, height - border - l);
  stroke(0);
  
  //drawing the bars
  for( int i = 0 ; i<clist.size() ; ++i)
  {
    fill(random(4,255),random(4,255),random(4,255) );
    rect( border + (barwidth*i), height-border-map(clist.get(i).potassium,0,400,0,hlinesize), barwidth, map(clist.get(i).potassium,0,400,0,hlinesize) );
  }
  
  if( mouseX > border && mouseX < width - border && mouseY > border && mouseY < height - border)
  {
    int i =(int) map(mouseX, border, width-border, 0, clist.size() );
    text(clist.get(i).name + "\n potassium : " + clist.get(i).potassium ,width/2, border*2);
  }
  
    
  
  
  
  //code to make the exit box
  fill(86);
  stroke(0);
  rect(width-20, 0, 20, 20);
  line(width-20,0,width,20);
  line(width,0,width-20,20);
}

//function to show the readme option
void drawreadme()
{
  background(0);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  fill(170,40,0);
  text("how to do things",width/2,height/10);
  
  textSize(25);
  textAlign(LEFT);
  fill(145,90,79);
  text("IN THE MENU",10,2*(height/10));
  text("IN THE CEREAL VS OPTION",10,4*(height/10));
  text("IN THE CEREAL BOX OPTION",10,6.5*(height/10));
  text("IN THE AVERAGE SUGAR INTAKE OPTION", 10, 8.5*(height/10) );
  textSize(15);
  fill(255);
  text("click in the center the circle to chooose the option \nand outside it for changing the option",20,2.5*(height/10));
  text("the graph shows potassium in cereals as when compared to a small banana \nthe yellow line shows amount of potassuim in the banana\nthe name of the cereal and amount of potassium is displayed on the top of the\nscreen",20,4.5*(height/10));
  text("this option lets you compare macronutrients in diff cereals\na list of cerelas will come up,enter the number you want to choose\nthe map is on the bottom left corner",20,7*(height/10));
  text("the graph shows the average sugar intake for different countries over \na number of years",20,9 *(height/10) );
  
  
  //code to make the exit box 
  fill(86);
  rect(width-20, 0, 20, 20);
  line(width-20,0,width,20);
  line(width,0,width-20,20);
}


void showcereals()
{
   background(0);
   fill(213);
   int a = 0;
   for( int i = 1 ; i < 6 ; ++i)
  {
    textAlign(TOP);
    textSize(17);
    text(a + " : " + clist.get(a).name,width/7,(height/6)*i+1);
    text(a+1 + ":" + clist.get(a+1).name, width-(width/2),(height/6)*i+1);
    a+=2;
  }
  
  
  //code to make the exit box
  fill(86);
  rect(width-20, 0, 20, 20);
  line(width-20,0,width,20);
  line(width,0,width-20,20); 
 
  if(keyPressed)
  {
    if(key == '0' || key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9')
    {
      cerealnumber =  (char(key))%48;
      println(cerealnumber);
      chose = true;
    } 
  }
     
}

void drawsugargraph()
{
  float max = 0.0f;
  for (Sugar  a : slist)
  {
    if(  a.us>max )
    max = a.us;
    if( a.canada>max)
    max = a.canada;
    if( a.germany>max )
    max = a.germany;
    if( a.france>max )
    max = a.france;
    if( a.uk>max)
    max = a.uk;
  }
  
  float min = max;
  
  for(Sugar b : slist)
  {
    if( b.us<min )
    min = b.us;
    if( b.canada<min)
    min = b.canada;
    if( b.germany<min )
    min = b.germany;
    if( b.france<min )
    min = b.france;
    if( b.uk<min)
    min = b.uk;
  }
   
   int minint = (int)min;
   int maxint = (int)max + 1;
   println(maxint);
   background(0);
  float border = 40;
  stroke(255);
  line(border,border,border,height-border);
  line(border,height-border,width-border,height-border);
  float hlinesize = height - (2*border);
  float pos = height - border;
  float dist = map(10,0,(maxint+5)-(minint-2),0,hlinesize);
  int num = 80;
  textSize(15);
  fill(255);
  for(int i = 0 ; i < maxint -minint ; ++i, num+=10)
  {
    line(border-10,pos,border,pos);
    text(num, border-40 , pos);
    pos-=dist;
  } 
  
  
 /*pos = border;
  dist = map(1,0,(int)slist.get(43).year - (int)slist.get(0).year, 0, hlinesize);
  println(dist);
  textSize(6);
  for( int i=0; i < slist.size()  ; ++i)
  {
    
    line(pos,height-border,pos,height-border+10);
    text((int)slist.get(i).year,pos,height-5);
    pos+=dist;
  }*/
  min-=2;
  max+=5;
   for (int i = 1 ; i < slist.size() ; i ++)
  {
    stroke(0, 255, 255);
    float x1 = map(i - 1, 0, slist.size() - 1, border, width - border);
    float y1 = map(slist.get(i - 1).germany, min, max, height - border, border);
    float x2 = map(i, 0, slist.size() - 1, border, width - border);
    float y2 = map(slist.get(i).germany, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
  
  for (int i = 1 ; i < slist.size() ; i ++)
  {
    stroke(255, 255, 0);
    float x1 = map(i - 1, 0, slist.size() - 1, border, width - border);
    float y1 = map(slist.get(i - 1).us, min, max, height - border, border);
    float x2 = map(i, 0, slist.size() - 1, border, width - border);
    float y2 = map(slist.get(i).us, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
  
  for (int i = 1 ; i < slist.size() ; i ++)
  {
    stroke(255, 0, 255);
    float x1 = map(i - 1, 0, slist.size() - 1, border, width - border);
    float y1 = map(slist.get(i - 1).uk, min, max, height - border, border);
    float x2 = map(i, 0, slist.size() - 1, border, width - border);
    float y2 = map(slist.get(i).uk, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
  
  for (int i = 1 ; i < slist.size() ; i ++)
  {
    stroke(0,0, 255);
    float x1 = map(i - 1, 0, slist.size() - 1, border, width - border);
    float y1 = map(slist.get(i - 1).france, min, max, height - border, border);
    float x2 = map(i, 0, slist.size() - 1, border, width - border);
    float y2 = map(slist.get(i).france, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
  
  for (int i = 1 ; i < slist.size() ; i ++)
  {
    stroke(0, 255, 0);
    float x1 = map(i - 1, 0, slist.size() - 1, border, width - border);
    float y1 = map(slist.get(i - 1).canada, min, max, height - border, border);
    float x2 = map(i, 0, slist.size() - 1, border, width - border);
    float y2 = map(slist.get(i).canada, min, max, height - border, border);
    line(x1, y1, x2, y2);
  }
  
  if( mouseX > border && mouseX < width-border )
  {
    stroke(255,0,0);
    line(mouseX,border,mouseX,height-border);
    
    //making the map 
  int i = (int) map(mouseX, border, width - border, 0, slist.size() - 1);
  textAlign(LEFT);
  fill(255,0,0);
  text((int)slist.get(i).year,width/6,height/10);
  //textAlign(CENTER);
  fill(0,255,255);
  text("GERMANY :" + ((int)slist.get(i).germany),width/8,(height/10)*1.5);
  fill(255,255,0);
  text("U.S. :" + ((int)slist.get(i).us),width/8,(height/10)*1.5 + 20);
  fill(255,0,255);
  text("U.K. :" + ((int)slist.get(i).uk),width/8,(height/10)*1.5 + 40);
  fill(0,0,255);
  text("FRANCE :" + ((int)slist.get(i).france),width/8,(height/10)*1.5 + 60);
  fill(0,255,0);
  text("CANADA :" + ((int)slist.get(i).canada),width/8,(height/10)*1.5 + 80);
  
}

  

}