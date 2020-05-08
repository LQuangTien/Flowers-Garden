/**********  
  HOUSE
**********/
Wall = function(){
  // x = 400, y = 300, wall size 300x300
  let x = sizeWidth/3;
  let y = sizeHeight/4;
  let width = sizeWidth/4;
  
  fill(234, 255, 135);
  rect(x, y, width, width);
};
Windows = function(){
  // x = 400 + 20, y = 300 +80, windows size 60x60 
  let x = sizeWidth/3 + sizeWidth/60;
  let y = sizeHeight/4 + sizeHeight*2/15;
  let width = sizeWidth/20;

  fill(255, 255, 255);
  rect(x, y, width, width);
  // right window, posX = x + 200 = x + sizeWidth/6
  rect(x + sizeWidth/6, y, width, width);
};
Door = function(){
  // x = 600 - 90, y = 300, door size 80x150 
  let x = sizeWidth/2 - sizeWidth*3/40;
  let y = sizeHeight/2;
  let width = sizeWidth/15;
  let height = sizeHeight/4;

  fill(189, 125, 60);
  rect(x, y, width, height);
};
Roof = function(){
  let x1 = sizeWidth/3;  
  let y1 = sizeHeight/10;  
  let x2 = sizeWidth*7/12;  
  let y2 = sizeHeight/10;  
  let x3 = sizeWidth*2/3;  
  let y3 = sizeHeight/4;  
  let x4 = sizeWidth/4;  
  let y4 = sizeHeight/4;  
  fill(181, 109, 33);
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
};

/*********
  Garden
*********/
// Grass
Grass = function(){
  // grass take 40%, sky take 60%
  let x = 0;
  let y = sizeHeight*3/5; 
  let width = sizeWidth;
  let height = sizeHeight*2/5;

  fill(0, 255, 0);
  rect(x, y, width, height);
}

// Flowers
Flower = function(x, y, height){
    this.x = x;
    this.y = y;
    this.height = height;
};
Flower.prototype.growBy = function(amount){
    this.height += amount;
};
// rose
var Rose = function(x, y, height) {
    Flower.call(this, x, y, height);
};
Rose.prototype = Object.create(Flower.prototype);
Rose.prototype.draw = function() {
    noStroke();
    fill(16, 122, 12);
    rect(this.x, this.y, this.height*0.1, -this.height);
    fill(250, 95, 151);
    // petals
    let x1 = this.x - this.height*0.2;
    let y1 = this.y - this.height*1.4;
    let x2 = this.x + this.height*0.3;
    let y2 = this.y - this.height*1.4;
    let x3 = this.x + this.height*0.15;
    let y3 = this.y - this.height;
    let x4 = this.x - this.height*0.05;
    let y4 = this.y - this.height;
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
};

// tulip
var Tulip = function(x, y, height) {
    Flower.call(this, x, y, height);
};
Tulip.prototype = Object.create(Flower.prototype);
Tulip.prototype.draw = function() {
    noStroke();
    fill(16, 122, 12);
    rect(this.x, this.y, this.height/10, -this.height);
    fill(255, 0, 0);
    // petals
    ellipse(this.x + this.height*0.05, this.y-this.height, this.height*2/5, this.height*2/5);
    triangle(this.x - this.height * 0.15, this.y - this.height, 
            this.x + this.height * 0.2, this.y - this.height,
            this.x - this.height * 0.2, this.y-this.height*1.3);
    triangle(this.x - this.height * 0.15, this.y - this.height, 
            this.x + this.height * 0.25, this.y - this.height,
            this.x + this.height * 0.05, this.y - this.height*1.4);
    triangle(this.x - this.height * 0.05, this.y - this.height, 
            this.x + this.height * 0.25, this.y - this.height,
            this.x + this.height * 0.3, this.y - this.height*1.35);
};

// sunflower
var Sunflower = function(x, y, height) {
    Flower.call(this, x, y, height);
};
Sunflower.prototype = Object.create(Flower.prototype);
Sunflower.prototype.draw = function() {
    fill(16, 122, 12);
    
    rect(this.x, this.y, this.height*0.1, -this.height);
    
    // petals
    stroke(0, 0, 0);
    fill(255, 221, 0);
    ellipse(this.x - this.height*0.1, this.y - this.height, this.height*0.2, this.height*0.18);
    ellipse(this.x + this.height*0.05, this.y - this.height*1.15, this.height*0.2, this.height*0.18);
    ellipse(this.x + this.height*0.05, this.y - this.height*0.85, this.height*0.2, this.height*0.18);
    ellipse(this.x + this.height*0.2, this.y - this.height, this.height*0.2, this.height*0.18);
    fill(20, 20, 20);
    ellipse(this.x + this.height*0.05, this.y - this.height, this.height*0.2, this.height*0.2);
};
generateFlowers = function(){
  let flowers = [];
  // create flowers
  for(let i = 0; i < 50; i++){
    let tulip = new Tulip(...createRandomPosition() );
    let rose = new Rose(...createRandomPosition() );
    let sunflower = new Sunflower(...createRandomPosition() );
    flowers.push(tulip, rose, sunflower);
  };
  // sorted by position y, in order not to overlap
  for(let i = 0; i < flowers.length - 1; i++){
    for(let j = i + 1; j < flowers.length; j++){
      if(flowers[i].y > flowers[j].y)
        [flowers[i], flowers[j]] = [flowers[j], flowers[i]];
    };
  };
  return flowers;
}

createRandomPosition = function(){

  let left = random(0, sizeWidth/3);
  let right = random(sizeWidth*7/12, sizeWidth);

  let top = random(sizeHeight*2/3, sizeHeight*23/30);
  let mid = random(sizeHeight*47/60, sizeHeight*53/60);
  let bot = random(sizeHeight*9/10, sizeHeight);

  let height = random(sizeHeight/12, sizeHeight*2/15);
  
  let randomNumber = round(random(0, 5));
  switch(randomNumber){
    case 0:
      return [left, top, height];
      break;
    case 1:
      return [left, mid, height*0.9];
      break;
    case 2:
      return [left, bot, height*0.8];
      break;
    case 3:
      return [right, top, height];
      break;
    case 4:
      return [right, mid, height*0.9];
      break;
    case 5:
      return [right, bot, height*0.8];
      break;
  }

};
/********
  MAIN
********/
drawHouse = function(){
  Wall();
  Windows();
  Door();
  Roof();
}
drawGarden = function(){
  Grass();
  for(let i = 0; i < moreFlow.length; i++){
    moreFlow[i].draw();
  };
}
var sizeWidth = 1200;
var sizeHeight = sizeWidth/2; //height = 600
var moreFlow = generateFlowers();
setup = function(){
  size(sizeWidth, sizeHeight);
};
draw = function(){
  drawGarden();
  drawHouse();
};
