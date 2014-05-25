import controlP5.*; // GUI library

MathUtil util;

AttractorManager mainAttractorManager;
KeyHandler mainKeyManager;

ControlP5 cp5;
DropdownList attractorList;

void setup() {
//	size(displayWidth, displayHeight, P3D);
	size(500, 500, P3D);

	util = new MathUtil();

	mainAttractorManager = new AttractorManager();

	mainKeyManager = new KeyHandler();

	cp5 = new ControlP5(this);
	attractorList = configureAttractorList(cp5.addDropdownList("attractorList"), mainAttractorManager.getAvailableAttractors());

	mainAttractorManager.setupAttractor(4);
}

boolean sketchFullScreen() {
//	return true;
	return false;
}

void draw() {
	background(0);
	mainKeyManager.update();
	mainAttractorManager.draw();
}

class KeyHandler {
	boolean w = false;
	boolean s = false;
	boolean d = false;
	boolean a = false;
	boolean up = false;
	boolean down = false;
	boolean right = false;
	boolean left = false;

	boolean shift = false;
	boolean option = false;
	boolean control = false;

	void update() {
		// calculate parameter multiplication factor
		float baseInc = 0.01;
		float multFactor = 1;
		if (shift) {
			multFactor = 100;
		} else if (option) {
			multFactor = 10;
		} else if (control) {
			multFactor = 0.1;
		}
		// command key suite (pairs are exclusive of each other - the negative increment only works if the positive increment is false)
		if (w) {
			mainAttractorManager.setAttractorParams(baseInc * multFactor, 0, 0, 0);
		} else if (s) {
			mainAttractorManager.setAttractorParams(-baseInc * multFactor, 0, 0, 0);
		}
		if (d) {
			mainAttractorManager.setAttractorParams(0, baseInc * multFactor, 0, 0);
		} else if (a) {
			mainAttractorManager.setAttractorParams(0, -baseInc * multFactor, 0, 0);
		}
		if (up) {
			mainAttractorManager.setAttractorParams(0, 0, baseInc * multFactor, 0);
		} else if (down) {
			mainAttractorManager.setAttractorParams(0, 0, -baseInc * multFactor, 0);
		}
		if (right) {
			mainAttractorManager.setAttractorParams(0, 0, 0, baseInc * multFactor);
		} else if (left) {
			mainAttractorManager.setAttractorParams(0, 0, 0, -baseInc * multFactor);
		}
	}
}

void keyReleased() {
	switch (keyCode) {
		// 'w'
		case 87: mainKeyManager.w = false; break;
		// 's'
		case 83: mainKeyManager.s = false; break;
		// 'd'
		case 68: mainKeyManager.d = false; break;
		// 'a'
		case 65: mainKeyManager.a = false; break;
		// up arrow
		case 38: mainKeyManager.up = false; break;
		// down arrow
		case 40: mainKeyManager.down = false; break;
		// right arrow
		case 39: mainKeyManager.right = false; break;
		// left arrow
		case 37: mainKeyManager.left = false; break;
		// shift key
		case 16: mainKeyManager.shift = false; break;
		// option key
		case 18: mainKeyManager.option = false; break;
		// control key
		case 17: mainKeyManager.control = false; break;
	}
}

void keyPressed() {
	switch (keyCode) {
		// spacebar
		case 32:
			mainAttractorManager.saveFrame();
			break;
		// 'w'
		case 87: mainKeyManager.w = true; break;
		// 's'
		case 83: mainKeyManager.s = true; break;
		// 'd'
		case 68: mainKeyManager.d = true; break;
		// 'a'
		case 65: mainKeyManager.a = true; break;
		// up arrow
		case 38: mainKeyManager.up = true; break;
		// down arrow
		case 40: mainKeyManager.down = true; break;
		// right arrow
		case 39: mainKeyManager.right = true; break;
		// left arrow
		case 37: mainKeyManager.left = true; break;
		// shift key
		case 16: mainKeyManager.shift = true; break;
		// option key
		case 18: mainKeyManager.option = true; break;
		// control key
		case 17: mainKeyManager.control = true; break;
	}
}

void controlEvent(ControlEvent evt) {
	int attNum = 0;
	if (evt.isGroup()) {
		attNum = (int) evt.getGroup().getValue();
	} else if (evt.isController()) {
		attNum = (int) evt.getController().getValue();
	}
	mainAttractorManager.setupAttractor(attNum);
}

DropdownList configureAttractorList(DropdownList newList, String[] listItems) {
	newList.setPosition(20, 20);
	newList.setItemHeight(18);
	newList.setBarHeight(18);
	newList.captionLabel().style().marginTop = 4;
	newList.valueLabel().style().marginTop = 4;
	newList.setSize(300, 20 * (listItems.length + 1)); // add one to account for label
	newList.addItems(listItems);
	return newList;
}