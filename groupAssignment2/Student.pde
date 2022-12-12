class Student {
  
  //0-10, 0-10, 0-50, 0-10
  int stressNow, stressMng, cashOnHand, popularity,
      xNow, yNow, xTrg, yTrg;
  ArrayList<Course> courseload;
  
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
    this.stressNow = this.initialSN();
    //print(this.stressNow);
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
  
  void moveStud() {
    Store storeNow = stores[int(this.xNow/200)];
    //Store storeNow = stores;
    
    if (this.xNow < this.xTrg) {
      if (!(this.xNow > 700-studRadius && this.yNow > 475-studRadius))
        this.xNow++;
    }
    else if (this.xNow > this.xTrg) {
      if (!(this.xNow < 300+studRadius && this.yNow > 475-studRadius))
        this.xNow--;
    }
    
    if (this.yNow < this.yTrg) {
      this.yNow++;
      if (this.yNow == 150+studRadius)
        storeNow.custNum--;
    }
    else if (this.yNow > this.yTrg) {
      if (!(this.yNow == 150+studRadius && this.xNow%200 == 0)) {
        if (this.yNow == 150+studRadius && this.cashOnHand > storeNow.pricePerPerson && storeNow.custNum+1 <= storeNow.custLim) {
          this.yNow--;
          storeNow.custNum++;
        }
        else if (storeNow.custNum+1 <= storeNow.custLim)
          this.yNow--;
      }
    }
  }
  
}
