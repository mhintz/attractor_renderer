// source: http://www.behance.net/gallery/MathRules-Strange-Attractors/7618879

class AizawaAttractor extends Attractor {
	float paramA = 0.25;
	float paramB = 0.95;
	float paramC = 0.6;
	float paramD = 3.5;
	float paramE = 0.7;
	float paramF = 0.1;
	float scaleParam = 0.06;

	AizawaAttractor() {
		maxIter = 40000;
		lastPt = new PVector(0.1, 0.1, 0.1);
		magFactor = 200;
		adjX = 0;
		adjY = 0;
		adjZ = 0;
		colorNoiseInd = new PVector(random(10), random(10), random(10));
		genPts(); // generates the points in this attractor
	}

	PVector nextPt() {
		float x = lastPt.x + scaleParam * ((lastPt.z - paramE) * lastPt.x - (paramD * lastPt.x + (lastPt.z - paramE) * lastPt.y));
		float y = lastPt.y + scaleParam * (paramD * lastPt.x + (lastPt.z - paramE) * lastPt.y);
		double z = lastPt.z + scaleParam * (paramC + paramB * lastPt.z - (Math.pow(lastPt.z, 3) / 3) - ((Math.pow(lastPt.x, 2) + Math.pow(lastPt.y, 2)) * (1 + paramA * lastPt.z)) + paramF * lastPt.z * Math.pow(lastPt.x, 3));
		PVector nextPt = new PVector(x, y, (float) z);
		lastPt = nextPt;
		return nextPt;
	}
}