// ref : https://qiita.com/yuji_yasuhara/items/cfe4b08e7438eca06eda

inline float2 modulo(float2 value, float2 scale)
{
    return floor((value%scale+scale)%scale);
}
			
inline float2 Unity_Voronoi_RandomVector_float (float2 UV, float offset)
{
    float2x2 m = float2x2(15.27, 47.63, 99.41, 89.98);
    UV = frac(sin(mul(UV, m)) * 46839.32);
    return float2(sin(UV.y*+offset)*0.5+0.5, cos(UV.x*offset)*0.5+0.5);
}
			
//x - Out y - Cells
float3 UnityTiledVoronoi(float2 UV, float AngleOffset, float CellDensity)
{
    CellDensity = floor(CellDensity);
    float2 g = floor(UV * CellDensity);
    float2 f = frac(UV * CellDensity);
    float t = 8.0;
    float3 res = float3(8.0, 0.0, 0.0);

    for(int y=-1; y<=1; y++)
    {
        for(int x=-1; x<=1; x++)
        {
            float2 lattice = float2(x,y);
            float2 offset = Unity_Voronoi_RandomVector_float(modulo(lattice + g, CellDensity), AngleOffset);
            float d = distance(lattice + offset, f);

            if(d < res.x)
            {
                
                res = float3(d, offset.x, offset.y);
            }
        }
    }
    return res;
}