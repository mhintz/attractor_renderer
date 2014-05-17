// source: http://paulbourke.net/fractals/lorenz/

class LorenzAttractor extends Attractor {
	// parameter set 1
/*	float paramA = 10;
	float paramB = 28;
	float paramC = 8 / 3;*/

	// parameter set 2
	float paramA = 28;
	float paramB = 46.92;
	float paramC = 4;

	LorenzAttractor() {
		name = "Lorenz";
		maxIter = 40000;
		lastPt = new PVector(0.1, 0, 0);
//		sP = 0.002; // goes with param set 1
		sP = 0.0006; // goes with param set 2
		magFactor = 8;
		adjX = 0;
		adjY = -20;
		adjZ = -400;
		colorIndex = new PVector(random(10), random(10), random(10));
		genPts(); // generates the points in this attractor
	}

	PVector getDelta() {
		float dx = paramA * (lastPt.y - lastPt.x);
		float dy = lastPt.x * (paramB - lastPt.z) - lastPt.y;
		float dz = lastPt.x * lastPt.y - paramC * lastPt.z;
		return new PVector(dx, dy, dz);
	}
}