// source: http://paulbourke.net/fractals/lorenz/

class LorenzAttractor extends Attractor {
	// parameter set 1
/*	float paramA = 10;
	float paramB = 28;
	float paramC = 8 / 3;
	float scaleParam = 0.002;*/

	// parameter set 2
	float paramA = 28;
	float paramB = 46.92;
	float paramC = 4;
	float scaleParam = 0.0006;

	LorenzAttractor() {
		maxIter = 40000;
		lastPt = new PVector(0.1, 0, 0);
		magFactor = 8;
		adjX = 0;
		adjY = -20;
		adjZ = -400;
		colorNoiseInd = new PVector(random(10), random(10), random(10));
		genPts(); // generates the points in this attractor
	}

	PVector nextPt() {
		float x = lastPt.x + scaleParam * (paramA * (lastPt.y - lastPt.x));
		float y = lastPt.y + scaleParam * (lastPt.x * (paramB - lastPt.z) - lastPt.y);
		float z = lastPt.z + scaleParam * (lastPt.x * lastPt.y - paramC * lastPt.z);
		PVector nextPt = new PVector(x, y, z);
		lastPt = nextPt;
		return nextPt;
	}
}