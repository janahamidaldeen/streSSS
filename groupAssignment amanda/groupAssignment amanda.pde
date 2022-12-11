import g4p_controls.*;

int hwAmount, testAmount, diffAmount;

//homework /5, tests /5, difficult /10

//Course math = new Course("Math", hwAmount, testAmount, diffAmount),
//  science = new Course("Science", hwAmount, testAmount, diffAmount),
//  languages = new Course("Languages", hwAmount, testAmount, diffAmount),
//  art = new Course("Art", hwAmount, testAmount, diffAmount),
//  tech = new Course("Tech", hwAmount, testAmount, diffAmount),
//  gym = new Course("Gym", hwAmount, testAmount, diffAmount);
//Course[] courses = {math, science, languages, art, tech, gym};

Course math = new Course("Math", 4,5,9),
  science = new Course("Science", 5,5,7),
  languages = new Course("Languages", 3,4,8),
  art = new Course("Art", 2,1,6),
  tech = new Course("Tech", 1,2,4),
  gym = new Course("Gym", 0,0,8);
Course[] courses = {math, science, languages, art, tech, gym};


//Store aStore;
Store[] stores = new Store[5];
//Store stores;

ArrayList<Student> students = new ArrayList<Student>();
int studRadius = 5;

float x = 0;
float y = 0;
float xSpeed = 5;   //user will eventually be able to set this using a slider bar
float ySpeed = 5;
float rad = 40;

int r = 0;

boolean paused = false;

int storeNum = 1;
int firstStoreX = 200*r;
int firstStoreY = 0;
int storeWidth = 200;
int storeHeight = 150;

int framesElapsed = 0;

int studentNum = 250;


void setup() {

  createGUI();
  writeStuds(250);

  String[] studInfo = loadStrings("streSSS I students.txt");
  for (int s=0; s<studInfo.length; s++)
    students.add(makeStud(studInfo[s]));

  for (int s=0; s<5; s++) {
    stores[s] = new Store(round(random(0, 10)), round(random(10, 100)), round(random(1, 25)), 1);
  }

  size(1000, 500);
}


void draw() {

  setScreen();

  //for (int s=0; s<students.size(); s++) {
  for (int s=0; s<studentNum; s++) {
    int g = round(255 - 12.75*students.get(s).stressNow), 
      b = round(255 - 25.5*students.get(s).stressNow);
    fill(255, g, b);
    circle(students.get(s).xNow, students.get(s).yNow, 2*studRadius);

    students.get(s).moveStud();
  }

}


void writeStuds(int n) {

  PrintWriter streSSSstuds = createWriter("streSSS I students.txt");
  for (int s=0; s<n; s++) {

    String str = round(random(0, 10)) + ", " + round(random(0, 50)) + ", " + round(random(0, 10)) + ", ";
    String[] courseOptions = {"Math, ", "Science, ", "Languages, ", "Art, ", "Tech, ", "Gym, "};
    for (int c=0; c<4; c++)
      str += courseOptions[int(random(0, courseOptions.length))];
    str += (round(random(300+studRadius, 700-studRadius)) + ", " + (500 + 10*s) + ", " + int(random(0, width)) + ", " + round(random(0, 475)));

    streSSSstuds.println(str);
  }
  streSSSstuds.flush();
  streSSSstuds.close();
}


Student makeStud(String txtln) {

  ArrayList<Course> studCourses = new ArrayList<Course>();
  for (int c=0; c<courses.length; c++) {
    if (txtln.indexOf(courses[c].name) > -1)
      studCourses.add(courses[c]);
  }

  int[] txtpart = int(txtln.split(", "));
  int T = txtpart.length;
  return new Student(txtpart[0], txtpart[1], txtpart[2], 
    studCourses, 
    txtpart[T-4], txtpart[T-3], txtpart[T-2], txtpart[T-1]);
}


void setScreen() {

  background(84, 166, 40); //Grass green
  stroke(0);


  if (storeNum == 1) {
    for (int r=0; r<1; r++) {
      fill(222);
      rect(200*r, 130, 200, 22);  //concrete
      
      fill(66,66,77);
      rect(200*r, 152, 200, 33); //tarmac road
      
      fill(int(r*100 % 255));
      rect(200*r, 0, 200, 130); //A row of grey rectangles for the stores
    }
  }
  
  else if (storeNum == 2) {
    for (int r=0; r<2; r++) {
      fill(222);
      rect(200*r, 130, 200, 22);  //concrete
      
      fill(66,66,77);
      rect(200*r, 152, 200, 33); //tarmac road
      
      fill(int(r*100 % 255));
      rect(200*r,0, 200, 130); //A row of grey rectangles for the stores
    }
  }
  else if (storeNum == 3) {
    for (int r=0; r<3; r++) {
      fill(222);
      rect(200*r, 130, 200, 22);  //concrete
      
      fill(66,66,77);
      rect(200*r, 152, 200, 33); //tarmac road
      
      fill(int(r*100 % 255));
      rect(200*r, 0, 200, 130); //A row of grey rectangles for the stores
    }
  }

  else if (storeNum == 4) {
    for (int r=0; r<4; r++) {
      fill(222);
      rect(200*r, 130, 200, 22);  //concrete
      
      fill(66,66,77);
      rect(200*r, 152, 200, 33); //tarmac road
      
      fill(int(r*100 % 255));
      rect(200*r, 0, 200, 130); //A row of grey rectangles for the stores
    }
  }
  
  else {
    for (int r=0; r<5; r++) {
      fill(222);
      rect(200*r, 130, 200, 22);  //concrete
      
      fill(66,66,77);
      rect(200*r, 152, 200, 33); //tarmac road
      
      fill(int(r*100 % 255));
      rect(200*r, 0, 200, 130); //A row of grey rectangles for the stores
      //stores[r].drawStores();
    }
  }


  noStroke();
  fill(170, 74, 68); //Brick red
  rect(0, 475, 300, 25);
  rect(700, 475, 300, 25); //Rectangles for the school building
  
  fill(200,100,10);
  circle(600, 360, 125); // sand playground
  fill(200);
  circle(642, 360, 50); //circular sitting space
  
  fill(55);
  rect(0,260, 123,200); //basketball court
  
  fill(222);
  rect(52, 265, 20, 10);
  rect(52, 445, 20, 10);
  
}
