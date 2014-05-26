class AttractorPt {
	PVector pos;
	color col;

	AttractorPt(PVector p, color c) {
		pos = p;
		col = c;
	}
}

class Attractor {
	String name;
	boolean is3D = true;
	int maxIter = 50000; // default number of iterations
	PVector lastPt;
	float sP = 1; // scale parameter
	float magFactor = 1; // default magnification factor for points
	float adjX = 0;
	float adjY = 0;
	float adjZ = 0;

	PVector colorIndex;
	AttractorPt[] pts = {};
	PVector minPt;
	PVector maxPt;

	float colorStep = 0.0008;
	float ptRadius = 1;

	Attractor() {
		colorIndex = new PVector(random(10), random(10), random(10));
	}

	void genPts() {
		pts = new AttractorPt[maxIter];
		minPt = lastPt.get();
		maxPt = lastPt.get();
		PVector pos;
		for (int i = 0; i < maxIter; ++i) {
			pos = nextPt();
			color col = nextColor();
			setMinMax(minPt, maxPt, pos);
			pts[i] = new AttractorPt(pos, col);
		}
	}

	// stub, should be overridden
	PVector getDelta() { return new PVector(0, 0, 0); }

	PVector nextPt() {
		PVector delta = getDelta();
		float x = lastPt.x + sP * delta.x;
		float y = lastPt.y + sP * delta.y;
		float z = lastPt.z + sP * delta.z;
		PVector nextPt = new PVector(x, y, z);
		lastPt = nextPt;
		return nextPt;
	}

	color nextColor() {
		colorIndex.add(colorStep, colorStep, colorStep);
		return color(convNoisePos(colorIndex.x), convNoisePos(colorIndex.y), convNoisePos(colorIndex.z));
	}

	float convNoisePos(float noiseInd) {
		return noise(noiseInd) * 255;
	}

	void setMinMax(PVector min, PVector max, PVector pt) {
		util.calcVecMin(min, pt);
		util.calcVecMax(max, pt);
	}

	// in case any update logic needs to be run between frames
	void update() { }

	void draw() {
		noStroke();
		pushMatrix();
		translate(width / 2 + adjX, height / 2 + adjY, 0);
		if (is3D) rotateY(sin(radians(frameCount * 2)) * PI / 2);
		translate(0, 0, adjZ); // I think doing this after the rotation helps
		for (int i = 0, l = pts.length; i < l; ++i) {
			drawPt(pts[i]);
		}
		popMatrix();
	}

	void drawPt(AttractorPt pt) {
		pushMatrix();
		translate(pt.pos.x * magFactor, pt.pos.y * magFactor, pt.pos.z * magFactor);
		fill(pt.col);
		box(ptRadius, ptRadius, ptRadius);
		popMatrix();
	}

	// stub, should be overridden
	String[] getParamsDisplay() { return new String[0]; }

	void drawParams() {
		// add parameter labels
		fill(255);
		textSize(14);
		int xPos = width - 100;
		int yOff = 20;
		String[] dispParams = getParamsDisplay();
		for (int i = 0, len = dispParams.length; i < len; ++i) {
			text(dispParams[i], xPos, yOff * (i + 1));
		}
	}

	/* default parameter update does nothing */
	boolean updateParam(int paramNum, float inc) {
		return false;
	}

}