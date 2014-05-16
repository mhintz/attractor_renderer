class AttractorPt {
	PVector pos;
	color col;

	AttractorPt(PVector p, color c) {
		pos = p;
		col = c;
	}
}

class Attractor {
	int maxIter = 40000;
	float ptRadius = 1;
	float magFactor = 1;
	float adjX = 0;
	float adjY = 0;
	float adjZ = 0;

	PVector colorNoiseInd;
	float colorStep = 0.0008;

	PVector lastPt;
	AttractorPt[] pts = {};

	void genPts() {
		for (int i = 0; i < maxIter; ++i) {
			PVector pos = nextPt();
			color col = nextColor();
			addPt(new AttractorPt(pos, col));
		}
	}

	void addPt(AttractorPt pt) { pts = (AttractorPt[]) append(pts, pt); }

	PVector nextPt() { return new PVector(); }

	color nextColor() {
		colorNoiseInd.add(colorStep, colorStep, colorStep);
		return color(noise(colorNoiseInd.x) * 255, noise(colorNoiseInd.y) * 255, noise(colorNoiseInd.z) * 255);
	}

	void draw() {
		fill(255);
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