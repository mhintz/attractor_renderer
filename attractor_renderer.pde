import controlP5.*; // GUI library

MathUtil util;

KeyManager mainKeyManager;
AttractorManager mainAttractorManager;

ControlP5 cp5;
DropdownList attractorList;

void setup() {
	size(displayWidth, displayHeight, P3D);
//	size(500, 500, P3D);

	util = new MathUtil();

	mainKeyManager = new KeyManager();
	mainAttractorManager = new AttractorManager();

	cp5 = new ControlP5(this);
	attractorList = configureAttractorList(cp5.addDropdownList("attractorList"), mainAttractorManager.getAvailableAttractors());

	// optional initial attractor
	mainAttractorManager.setupAttractor(4);
	attractorList.setIndex(4);
}

boolean sketchFullScreen() {
	return true;
//	return false;
}

void update() {
	mainKeyManager.update();
	mainAttractorManager.update();
}

void draw() {
	update();

	background(0);
	mainAttractorManager.draw();
}

class KeyManager {
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
		float baseInc = 0.1;
		float multFactor = 1;

		// calculate parameter multiplication factor
		if (shift) {
			multFactor = 10;
		} else if (option) {
			multFactor = 0.1;
		} else if (control) {
			multFactor = 0.01;
		}

		float inc = baseInc * multFactor;
		// command key suite (pairs are exclusive of each other - the negative increment only works if the positive increment is false)
		if (w) mainAttractorManager.updateAttractorParam(0, inc);
		if (s && !w) mainAttractorManager.updateAttractorParam(0, -inc);
		if (d) mainAttractorManager.updateAttractorParam(1, inc);
		if (a && !d) mainAttractorManager.updateAttractorParam(1, -inc);
		if (up) mainAttractorManager.updateAttractorParam(2, inc);
		if (down && !up) mainAttractorManager.updateAttractorParam(2, -inc);
		if (right) mainAttractorManager.updateAttractorParam(3, inc);
		if (left && !right) mainAttractorManager.updateAttractorParam(3, -inc);
	}
}

void keyPressed() {
	toggleInputKey(true);
}

void keyReleased() {
	toggleInputKey(false);
}

void toggleInputKey(boolean toggle) {
	switch (keyCode) {
		// spacebar
		case 32:
			if (toggle) {
				mainAttractorManager.saveFrame();
			}
			break;
		// 'w'
		case 87: mainKeyManager.w = toggle; break;
		// 's'
		case 83: mainKeyManager.s = toggle; break;
		// 'd'
		case 68: mainKeyManager.d = toggle; break;
		// 'a'
		case 65: mainKeyManager.a = toggle; break;
		// up arrow
		case 38: mainKeyManager.up = toggle; break;
		// down arrow
		case 40: mainKeyManager.down = toggle; break;
		// right arrow
		case 39: mainKeyManager.right = toggle; break;
		// left arrow
		case 37: mainKeyManager.left = toggle; break;
		// shift key
		case 16: mainKeyManager.shift = toggle; break;
		// option key
		case 18: mainKeyManager.option = toggle; break;
		// control key
		case 17: mainKeyManager.control = toggle; break;
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