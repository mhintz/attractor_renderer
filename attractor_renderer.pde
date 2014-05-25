import controlP5.*; // GUI library

MathUtil util;

AttractorManager mainAttractorManager;

ControlP5 cp5;
DropdownList attractorList;

void setup() {
	size(displayWidth, displayHeight, P3D);

	util = new MathUtil();

	mainAttractorManager = new AttractorManager();

	cp5 = new ControlP5(this);
	attractorList = configureAttractorList(cp5.addDropdownList("attractorList"), mainAttractorManager.getAvailableAttractors());
}

boolean sketchFullScreen() {
	return true;
}

void draw() {
	background(0);
	mainAttractorManager.draw();
}

void keyPressed() {
	if (key == ' ') {
		mainAttractorManager.saveFrame();
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