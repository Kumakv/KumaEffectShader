// Cyclic noise is created by nimitz.
// He uses it a lot, like in here: https://www.shadertoy.com/view/wl3czN
// I just rewrote his code, renamed some variables and tried to explain it a bit.

// Left is vanilla 
// Right is the derivative, fed into a pallete

// The basic structure of the loop is like an fbm.
// You are stacking octaves of noise.
// But the noise itself is generated in an interesting way:
// You do something like a 1-tap dot prodcut (Perlin,Simplex) noise inside of a sinewave lattice.
// Then you apply some rotation and scale, and repeat. 


float3x3 getOrthogonalBasis(float3 direction){
    direction = normalize(direction);
    float3 right = normalize(cross(float3(0,1,0),direction));
    float3 up = normalize(cross(direction, right));
    return float3x3(right,up,direction);
}

float cyclicNoise(float3 p, float _isDerivative){
    float noise = 0.;
                
    // These are the variables. I renamed them from the original by nimitz
    // So they are more similar to the terms used be other types of noise
    float amp = 1.;
    const float gain = 0.6;
    const float lacunarity = 1.5;
    const int octaves = 8;
    
    const float warp = 0.3;    
    float warpTrk = 1.2 ;
    const float warpTrkGain = 1.5;
    
    // Step 1: Get a simple arbitrary rotation, defined by the direction.
    float3 seed = float3(-1,-2.,0.5);
    float3x3 rotMatrix = getOrthogonalBasis(seed);
    
    for(int i = 0; i < octaves; i++){
    
        // Step 2: Do some domain warping, Similar to fbm. Optional.
        
        p += sin(p.zxy*warpTrk - 2.*warpTrk)*warp; 
    
        // Step 3: Calculate a noise value. 
        // This works in a way vaguely similar to Perlin/Simplex noise,
        // but instead of in a square/triangle lattice, it is done in a sine wave.
        
        noise += sin(dot(cos(p), sin(p.zxy )))*amp;
        
        // Step 4: Rotate and scale. 
        
        p = mul(p,rotMatrix);
        p *= lacunarity;
        
        warpTrk *= warpTrkGain;
        amp *= gain;
    }
    if(_isDerivative){
        return 1. - abs(noise)*0.5;
    } else {
        return (noise*0.25 + 0.5);
    }
}