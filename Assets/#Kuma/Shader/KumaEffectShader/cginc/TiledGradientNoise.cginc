// ref : https://qiita.com/yuji_yasuhara/items/cfe4b08e7438eca06eda
inline float2 modulo2(float2 value, float2 scale)
{
    return floor((value%scale+scale)%scale);
}

float2 Unity_GradientNoise_Dir_float(float2 p, float Period)
{
    p = modulo2(p, Period);
    // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
    p = p % 289;
    float x = (34 * p.x + 1) * p.x % 289 + p.y;
    x = (34 * x + 1) * x % 289;
    x = frac(x / 41) * 2 - 1;
    return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
}
			
float UnityTiledGradientNoise(float2 UV, float Scale)
{ 
    float Period = floor(Scale);
    float2 p = UV * Period;
    float2 ip = floor(p);
    float2 fp = frac(p);
    float d00 = dot(Unity_GradientNoise_Dir_float(ip, Period), fp);
    float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1), Period), fp - float2(0, 1));
    float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0), Period), fp - float2(1, 0));
    float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1), Period), fp - float2(1, 1));
    fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
    return lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
}
