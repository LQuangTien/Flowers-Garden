// 1 o vuong, 2 cai cua so, 1 cai cua chinh, mai nha gom 1 o vuong, 2 tam giac, loi di vo nha
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
Grass = function(){
  // grass take 40%, sky take 60%
  let x = 0;
  let y = sizeHeight*3/5;
  let width = sizeWidth;
  let height = sizeHeight*2/5;
  fill(0, 255, 0);
  rect(x, y, width, height);
}
drawHouse = function(){
  Wall();
  Windows();
  Door();
  Roof();
}
drawGarden = function(){
  Grass();
}
var sizeWidth = 1200;
var sizeHeight = 600;
setup = function(){
  size(sizeWidth, sizeHeight);
};
draw = function(){
  drawGarden();
  drawHouse();
};
