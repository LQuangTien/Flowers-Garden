/**********
  SKY
**********/

drawSun = function(x, y){
  let posX = x;
  let posY = y;
  let radius = sizeWidth/12;

  fill(255, 145, 40);
  ellipse(posX, posY, radius, radius);
}
drawMoon = function(x, y){
  let posX = x;
  let posY = y;
  let radius = sizeWidth/18;

  fill(240, 240, 30);
  ellipse(posX, posY, radius, radius);
}

Cloud = function(){
  this.x = random(0, sizeWidth);
  this.y = random(sizeHeight/24, sizeHeight*3/5);
  this.width = random(sizeWidth/12, sizeWidth/6);
  this.height = this.width/2;

  let direction = round(random(0,1));
  if(direction === 0){
    // go to the right
    this.speed = round(random(1,5));
  } else {
    // go to the left
    this.speed = -round(random(1,5));
  }
   
};
Cloud.prototype.draw = function(){
  fill(255);
  ellipse(this.x, this.y, this.width, this.height);
};
Cloud.prototype.move = function(){
  this.x += this.speed;

  // if cloud out of screen
  if(this.x > sizeWidth*14/12 || this.x < -sizeWidth/6){
    // set y position 
    this.y = random(sizeHeight/24, sizeHeight*3/5);
    // set random x position
    let direction = round(random(0,1));
    if(direction === 0){
      // start from left, move to the right
      this.x = -sizeWidth/6;
      this.speed = round(random(1,5));
    } else {
      // start from right, move to the left
      this.x = sizeWidth*14/12;
      this.speed = -round(random(1,5));
    }
  }
};
createCloud = function(numberOfCloud){
  let clouds = [];
  // create clouds
  for(let cloud = 0; cloud < numberOfCloud; cloud++){
    let newCloud = new Cloud();
    clouds.push(newCloud);
  }
  return clouds;
}
drawCloud = function(){ 
  // clouds = createCloud(), global variable
  for(let cloud = 0; cloud < clouds.length; cloud++){
    clouds[cloud].draw();
    clouds[cloud].move();
  };
}

/**********  
  HOUSE
**********/

drawWall = function(){
  // x = 400, y = 300, wall size 300x300
  let x = sizeWidth/3;
  let y = sizeHeight/4;
  let width = sizeWidth/4;
  
  fill(234, 255, 135);
  rect(x, y, width, width);
};
drawWindows = function(){
  // x = 400 + 20, y = 300 +80, windows size 60x60 
  let x = sizeWidth/3 + sizeWidth/60;
  let y = sizeHeight/4 + sizeHeight*2/15;
  let width = sizeWidth/20;

  fill(255, 255, 255);
  rect(x, y, width, width);
  // right window, posX = x + 200 = x + sizeWidth/6
  rect(x + sizeWidth/6, y, width, width);
};
drawDoor = function(){
  // x = 600 - 90, y = 300, door size 80x150 
  let x = sizeWidth/2 - sizeWidth*3/40;
  let y = sizeHeight/2;
  let width = sizeWidth/15;
  let height = sizeHeight/4;

  fill(189, 125, 60);
  rect(x, y, width, height);
};
drawRoof = function(){
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
drawWalkway = function(){
  let x1 = sizeWidth/2 - sizeWidth*3/40;
  let y1 = sizeHeight*3/4;  
  let x2 = sizeWidth/2 - sizeWidth/120;  
  let y2 = sizeHeight*3/4;  
  let x3 = sizeWidth/2 + sizeWidth/10;  
  let y3 = sizeHeight;  
  let x4 = sizeWidth/2 - sizeWidth/6;
  let y4 = sizeHeight;  
  fill(160);
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
}

/*********
  Garden
*********/

// Grass
drawGrass = function(){
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
Flower.prototype.grow = function(){
    this.height += this.height*0.05;
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
    noStroke();
    fill(255, 221, 0);
    ellipse(this.x - this.height*0.1, this.y - this.height, this.height*0.2, this.height*0.18);
    ellipse(this.x + this.height*0.05, this.y - this.height*1.15, this.height*0.2, this.height*0.18);
    ellipse(this.x + this.height*0.05, this.y - this.height*0.85, this.height*0.2, this.height*0.18);
    ellipse(this.x + this.height*0.2, this.y - this.height, this.height*0.2, this.height*0.18);
    fill(20, 20, 20);
    ellipse(this.x + this.height*0.05, this.y - this.height, this.height*0.2, this.height*0.2);
};
var OrangeFlower = function(x, y, height) {
    Flower.call(this, x, y, height);
};
// A orange flower
OrangeFlower.prototype = Object.create(Flower.prototype);
OrangeFlower.prototype.draw = function() {
  fill(16, 122, 12);
    
  rect(this.x, this.y, this.height*0.1, -this.height);
  
  // petals
  noStroke();
  fill(255, 100, 0);
  ellipse(this.x - this.height*0.05, this.y - this.height*1.1, this.height*0.2, this.height*0.2);
  ellipse(this.x + this.height*0.15, this.y - this.height*1.1, this.height*0.2, this.height*0.2);
  ellipse(this.x - this.height*0.05, this.y - this.height*0.9, this.height*0.2, this.height*0.2);
  ellipse(this.x + this.height*0.15, this.y - this.height*0.9, this.height*0.2, this.height*0.2);
  
  fill(255, 128, 0);
  ellipse(this.x + this.height*0.05, this.y - this.height, this.height*0.2, this.height*0.2);
};

// A purple flower
var PurpleFlower = function(x, y, height) {
    Flower.call(this, x, y, height);
};
PurpleFlower.prototype = Object.create(Flower.prototype);
PurpleFlower.prototype.draw = function() {
  fill(16, 122, 12);
    
  rect(this.x, this.y, this.height*0.1, -this.height);
  
  // petals
  noStroke();
  fill(255, 100, 0);
  
  fill(211, 59, 235);
  ellipse(this.x + this.height*0.05, this.y - this.height, this.height*0.4, this.height*0.4);
};
createFlowers = function(numberOfEachType){
  let flowers = [];
  // create flowers
  for(let flower = 0; flower < numberOfEachType; flower++){
    let tulip = new Tulip(...createRandomPosition() );
    let rose = new Rose(...createRandomPosition() );
    let sunflower = new Sunflower(...createRandomPosition() );
    let orange = new OrangeFlower(...createRandomPosition() );
    let purple = new PurpleFlower(...createRandomPosition() );
    flowers.push(tulip, rose, sunflower, orange, purple);
  };
  // sort position y ascending, in order not to overlap
  for(let flower = 0; flower < flowers.length - 1; flower++){
    for(let nextFlower = flower + 1; nextFlower < flowers.length; nextFlower++){
      if(flowers[flower].y > flowers[nextFlower].y)
        // swap 2 flowers
        [flowers[flower], flowers[nextFlower]] = [flowers[nextFlower], flowers[flower]];
    };
  };
  return flowers;
}

createRandomPosition = function(){
  // left side and right side of house
  let left = random(0, sizeWidth/3 - sizeWidth/24);
  let right = random(sizeWidth*7/12 + sizeWidth/24, sizeWidth);

  // 3 lane of flower
  // random(400, 460)
  let top = random(sizeHeight*2/3, sizeHeight*23/30);
  // random(470, 530)
  let mid = random(sizeHeight*47/60, sizeHeight*53/60);
  // random(540, 600)
  let bot = random(sizeHeight*9/10, sizeHeight);
  
  let height = random(sizeHeight/12, sizeHeight*2/15);
  
  let randomNumber = round(random(0, 5));
  // different size of flowers, at bot is smallest, top is largest
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
drawFlowers = function(){ 
  //flowerList is global variable
  for(let flower = 0; flower < flowerList.length; flower++){
    flowerList[flower].draw();
  };
}
growFlowers = function(){ 
  for(let flower = 0; flower < flowerList.length; flower++){
    flowerList[flower].grow();
  };
}
/********
  MAIN
********/
var sizeWidth = 1200;
var sizeHeight = sizeWidth/2; //height = 600

// createFlowers(numberOfEachType)
var flowerList = createFlowers(10);
// createCloud(numberOfCloud)
var clouds = createCloud(7);

setup = function(){
  size(sizeWidth, sizeHeight);
};

drawSky = function(){
  drawCloud();
}
drawHouse = function(){
  drawWall();
  drawWindows();
  drawDoor();
  drawRoof();
  drawWalkway();
}
drawGarden = function(){
  drawGrass();
  drawFlowers();
}

mouseClicked = function(){
  growFlowers();
}
draw = function(){
  //evening
  background(22,111,114);
  drawGarden();
  drawHouse();

  //moring
  if(mouseY < sizeHeight*7/12){
    background(60,215,215);
    drawSun(mouseX, mouseY);
    drawSky();
    drawGarden();
    drawHouse();

    // night
    if(mouseX > sizeWidth/2){
      background(50);
      drawMoon(mouseX, mouseY);
      drawGarden();
      drawHouse();
    } 
  }
}
