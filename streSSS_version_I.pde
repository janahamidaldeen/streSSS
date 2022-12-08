Course math = new Course("Math", 4, 5, 9),
       science = new Course("Science", 5, 5, 7),
       languages = new Course("Languages", 3, 4, 8),
       art = new Course("Art", 2, 1, 6),
       tech = new Course("Tech", 1, 2, 4),
       gym = new Course("Gym", 0, 0, 8); //Homework /5, tests /5, difficulty /10
Course[] courses = {math, science, languages, art, tech, gym};

Store[] stores = new Store[5];

ArrayList<Student> students = new ArrayList<Student>();
int studRadius = 8;
ArrayList<Integer> fightX = new ArrayList<Integer>(),
                   fightY = new ArrayList<Integer>();


void setup() {
  
  writeStuds(500);
  
  String[] studInfo = loadStrings("streSSS I students.txt");
  for (int s=0; s<studInfo.length; s++)
    students.add(makeStud(studInfo[s]));
  
  for (int s=0; s<5; s++)
    stores[s] = new Store(round(random(10)), round(random(5, 20)), round(random(1, 25)));
    
  size(1000, 500);
  
}


void draw() {
  setScreen();
  
  ArrayList<Student> dangers = new ArrayList<Student>();

  for (int s=0; s<students.size(); s++) {
    
    fill(students.get(s).fillColNow());
    circle(students.get(s).xNow, students.get(s).yNow, 2*studRadius); 
    
    if (students.get(s).stressNow > 7) {
      dangers.add(students.get(s));
      if (dangers.size() > 0) {
        for (int t=0; t<dangers.size(); t++) {
          if (students.get(s).xNow == dangers.get(t).xNow
              && students.get(s).yNow == dangers.get(t).yNow) {
            students.get(s).fight(dangers.get(t));
          }
        }
      }
    }
    
    if (! students.get(s).losingIt)
      students.get(s).moveStud();
  }
  
}


void writeStuds(int n) {
  
  PrintWriter streSSSstuds = createWriter("streSSS I students.txt");
  for (int s=0; s<n; s++) {
    
    String str = round(random(10)) + ", " + round(random(50)) + ", " + round(random(10)) + ", ";
    String[] courseOptions = {"Math, ", "Science, ", "Languages, ", "Art, ", "Tech, ", "Gym, "};
    for (int c=0; c<4; c++)
      str += courseOptions[int(random(courseOptions.length))];
    str += (round(random(300+studRadius, 700-studRadius)) + ", " + (500 + 10*s) + ", " + int(random(width)) + ", " + round(random(0, 475)));
    
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
  
  for (int r=0; r<5; r++) {
    fill(int(r*100 % 255));
    rect(200*r, 0, 200, 150); //A row of grey rectangles for the stores
  }
  noStroke();
  fill(170, 74, 68); //Brick red
  rect(0, 475, 300, 25);
  rect(700, 475, 300, 25); //Rectangles for the school building
  
}
