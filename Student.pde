class Student {
  
  
  //0-10, 0-10, 0-50, 0-10
  int stressNow, stressMng, cashOnHand, popularity,
      xNow, yNow, xTrg, yTrg;
  ArrayList<Course> courseload;
  boolean losingIt;
  
  
  Student(int sM, int cOH, int p,
          ArrayList<Course> c,
          int xN, int yN, int xT, int yT) {
            
    this.stressMng = sM;
    this.cashOnHand = cOH;
    this.popularity = p;
    this.courseload = c;
    this.xNow = xN;
    this.yNow = yN;
    this.xTrg = xT;
    this.yTrg = yT;
    this.losingIt = false;
    this.stressNow = this.initialSN();
    
  }
  
  
  int initialSN() {
    
    float stress = 0;
    
    for (int c=0; c<this.courseload.size(); c++)
      stress += this.courseload.get(c).stressfulness;
    stress /= 4;
    
    stress = (stress + 2*abs(popularity - 5))/2;
    
    stress -= this.stressMng;
    
    if (stress < 0)
      stress = 0;
    else if (stress > 10)
      stress = 10;
      
    return int(stress);
  }
  
  
  color fillColNow() {
    color f;
    
    if (this.losingIt) {
      color[] breakdownColour = {color(255, 0, 0), color(0)};
      f = breakdownColour[int(random(breakdownColour.length))];
      if (this.stressNow == 0)
        this.losingIt = false;
      else if (int(random(20)) == 0)
        this.stressNow--;
    }
    
    else {
      int g = round(255 - 12.75*this.stressNow),
          b = round(255 - 25.5*this.stressNow);
      f = color(255, g, b);
    }
  
    return f;
  }
  
  
  void moveStud() {
    
    Store storeNow = stores[int(this.xNow/200)]; //Which store is in line with the student
    if (this.xNow == 1000)
      storeNow = stores[4];
    boolean inSchool = (this.yNow+studRadius > 475),
            inStores = (this.yNow-studRadius < 150);
    
    if (this.xNow < this.xTrg) { //Moving right
      if (!(inSchool && this.xNow+studRadius > 700)
       && !(inStores && (this.xNow+studRadius)%200 < studRadius)) //Unless restricted by school/store walls
        this.xNow++;
    }
    
    else if (this.xNow > this.xTrg) {
      if (!(inSchool && this.xNow-studRadius < 300)
       && !(inStores && (this.xNow-studRadius)%200 > 200-studRadius))
        this.xNow--;
    }
    
    if (this.yNow < this.yTrg) { //Moving down
      if (!(this.yNow+studRadius == 475 && (this.xNow-studRadius < 300 || this.xNow+studRadius > 700))) {
        this.yNow++;
        if (this.yNow-studRadius == 150) //Acknowledging space freeing up in store
          stores[int(this.xNow/200)].custNum--;
      }
    }
    
    else if (this.yNow > this.yTrg) {
      if (!(this.yNow-studRadius == 150 && this.xNow%200 == 0)) {
        
        if (this.yNow-studRadius == 150) { //Assigning rules to students about to enter a store
          if (this.cashOnHand >= storeNow.pricePerPerson && storeNow.custNum+1 <= storeNow.custLim) {
            this.yNow--;
            stores[int(this.xNow/200)].custNum++;
            this.cashOnHand -= storeNow.pricePerPerson;
          }
          else { //If a student can't enter a store, that could cause a breakdown
            this.xTrg = round(random(width));
            this.yTrg = round(random(height));
            if (this.stressNow > 7)
              this.losingIt = true;
            if (this.stressNow < 10)
              this.stressNow++;
          }
          
        }
        else //If there's no store coming up
          this.yNow--;
      }
    }
    
    else {
      if (round(random(this.stressNow))-round(random(this.stressNow)) > 5) { //More stressed students are less at rest
        this.xTrg = round(random(width));
        this.yTrg = round(random(height));
      }
    }
    
  }
  
  
  void fight(Student that) {
    this.losingIt = that.losingIt = true;
    
    this.xTrg = that.xNow;
    this.yTrg = that.yNow;
    that.xTrg = this.xNow;
    that.yTrg = this.yNow;
    
    println("FIGHT");
    
  }
  
  
}
