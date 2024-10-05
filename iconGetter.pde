PGraphics icons;
PGraphics iconNormal;
PGraphics iconLosing;

PImage iconGrid;
Boolean loaded;
File image;

ArrayList<FNFIcon> chars;
int curChar;
int target;

void setup() {
  frameRate(60);
  size(300, 450);
  
  loaded = false;
  chars = new ArrayList<FNFIcon>();
  addCharacters();
  curChar = 0;
  
  icons = createGraphics(300, 150);
  iconNormal = createGraphics(150, 150);
  iconLosing = createGraphics(150, 150);
  
  selectInput("Select your icon grid:", "theThing");
}

void addCharacters() {
  // TODO: Make this read from a JSON rather than whatever this is
  chars.add(new FNFIcon("Boyfriend", "bf", 0, 0, 150, 0));
  chars.add(new FNFIcon("Spooky Kids", "spooky", 300, 0, 450, 0));
  chars.add(new FNFIcon("Pico", "pico", 600, 0, 750, 0));
  chars.add(new FNFIcon("Mom", "mom", 900, 0, 1050, 0));
  chars.add(new FNFIcon("Tankman", "tankman", 1200, 0, 1350, 0));
  chars.add(new FNFIcon("Face", "face", 0, 150, 150, 150));
  chars.add(new FNFIcon("Dad", "dad", 300, 150, 450, 150));
  chars.add(new FNFIcon("Boyfriend (Old)", "bf-old", 600, 150, 750, 150));
  chars.add(new FNFIcon("Girlfriend", "gf", 900, 150, 900, 150));
  chars.add(new FNFIcon("Parents", "parents", 1050, 150, 1200, 150));
  chars.add(new FNFIcon("Monster", "monster", 1350, 150, 0, 300));
  chars.add(new FNFIcon("Boyfriend (Pixel)", "bf-pixel", 150, 300, 150, 300));
  chars.add(new FNFIcon("Senpai", "senpai", 300, 300, 300, 300));
  chars.add(new FNFIcon("Spirit", "spirit", 450, 300, 450, 300));
}

void theThing(File selection) {
  image = selection;
  
  iconGrid = loadImage(image.getAbsolutePath());
  
  loaded = true;
  
  updateIcons(false);
}

void updateIcons(Boolean clearIcons) {
  if (loaded) {
    if (clearIcons) {
      iconNormal.clear();
      iconLosing.clear();
      icons.clear();
    }
    
    iconNormal.beginDraw();
    iconNormal.image(iconGrid, chars.get(curChar).x, chars.get(curChar).y);
    iconNormal.endDraw();
    
    iconLosing.beginDraw();
    iconLosing.image(iconGrid, chars.get(curChar).losingX, chars.get(curChar).losingY);
    iconLosing.endDraw();
    
    icons.beginDraw();
    icons.image(iconNormal, 0, 0);
    icons.image(iconLosing, 150, 0);
    icons.endDraw();
  }
}

void draw() {
  background(40);
  textSize(18);
  textAlign(LEFT, TOP);
  text("Loaded!", 10, 10);
  text("Please select your file:", 10, 30);
  
  if (loaded) {
    fill(30, 170, 30);
    text(image.getAbsolutePath(), 10, 50, 260, 400);
    fill(255);
    textAlign(CENTER, BOTTOM);
    text("Press ENTER to save this icon!\n< " + chars.get(curChar).name + " >", 150, 280);
    
    image(icons, 0, 300);
  }
}

void keyPressed() {
  if (loaded && keyPressed) {
    if (key == CODED) {
      switch (keyCode) {
        case LEFT:
          changeIconLeft();
          break;
        case RIGHT:
          changeIconRight();
          break;
      }
    }
    else {
      if (key == ENTER) icons.save("icon-" + chars.get(curChar).id + ".png");
    }
  }
}

void changeIconRight() {
  target = curChar + 1;
  
  if (target > (chars.size() - 1)) target = 0;
  
  curChar = target;
  println(curChar);
  updateIcons(true);
}

void changeIconLeft() {
  target = curChar - 1;
  if (target < 0) target = chars.size() - 1;
  
  curChar = target;
  println(curChar);
  updateIcons(true);
}
