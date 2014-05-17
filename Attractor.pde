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
	int maxIter = 50000; // default number of iterations
	PVector lastPt;
	float sP = 1; // scale parameter
	float magFactor = 1; // default magnification factor for points
	float adjX = 0;
	float adjY = 0;
	float adjZ = 0;

	PVector colorIndex;
	AttractorPt[] pts = {};

	float colorStep = 0.0008;
	float ptRadius = 1;

	void genPts() {
		for (int i = 0; i < maxIter; ++i) {
			PVector pos = nextPt();
			color col = nextColor();
			addPt(new AttractorPt(pos, col));
		}
	}

	void addPt(AttractorPt pt) { pts = (AttractorPt[]) append(pts, pt); }

	// stub. This should be overridden
	PVector getDelta() { return new PVector(); }

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

	void draw() {
		noStroke();
		translate(width / 2 + adjX, height / 2 + adjY, 0);
		rotateY(sin(radians(frameCount * 2)) * PI / 2);
		translate(0, 0, adjZ); // I think doing this after the rotation helps
		for (int i = 100, l = pts.length; i < l; ++i) {
			drawPt(pts[i]);
		}
	}

	void drawPt(AttractorPt pt) {
		pushMatrix();
		translate(pt.pos.x * magFactor, pt.pos.y * magFactor, pt.pos.z * magFactor);
		fill(pt.col);
		box(ptRadius, ptRadius, ptRadius);
		popMatrix();
	}

}