class MathUtil {
	// utils
	float flSin(float n) {
		return (float) Math.sin(n);
	}

	float flCos(float n) {
		return (float) Math.cos(n);
	}

	float flSq(float n) {
		return (float) Math.pow(n, 2);
	}

	float flCu(float n) {
		return (float) Math.pow(n, 3);
	}

	void calcVecMax(PVector store, PVector pt) {
		store.x = Math.max(store.x, pt.x);
		store.y = Math.max(store.y, pt.y);
		store.z = Math.max(store.z, pt.z);
	}

	void calcVecMin(PVector store, PVector pt) {
		store.x = Math.min(store.x, pt.x);
		store.y = Math.min(store.y, pt.y);
		store.z = Math.min(store.z, pt.z);
	}

	float roundTo(float n, int places) {
		return round(n * pow(10, places)) / pow(10, places);
	}

	float noiseIndex = random(20);

	float noiseRandom(float min, float max) {
		noiseIndex += 0.1;
		return min + (noise(noiseIndex) * (max - min));
	}
}

class NoiseVector {
	float inc = 0.01;
	float[][] ranges;
	float[] indexes;

	NoiseVector(float[][] cRanges) {
		ranges = cRanges;
		indexes = new float[ranges.length];
		for (int i = 0, len = ranges.length; i < len; ++i) {
			indexes[i] = random(20);
		}
	}

	float[] getNext() {
		float[] values = new float[ranges.length];
		for (int i = 0, len = ranges.length; i < len; ++i) {
			indexes[i] += inc;
			values[i] = valFromRng(indexes[i], ranges[i]);
		}
		return values;
	}

	float valFromRng(float ind, float[] rng) {
		return rng[0] + noise(ind) * (rng[1] - rng[0]);
	}
}
