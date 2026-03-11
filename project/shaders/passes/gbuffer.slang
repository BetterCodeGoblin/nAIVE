// G-Buffer geometry pass: writes albedo+roughness, normal+metallic, emission to MRT
import camera;

struct DrawUniforms {
    float4x4 model_matrix;
    float4x4 normal_matrix;
    float4 base_color;
    float roughness;
    float metallic;
    float has_texture;
    float has_skin;
    float4 emission;
};

[[vk::binding(0, 0)]] ConstantBuffer<CameraUniform> camera;
[[vk::binding(0, 1)]] ConstantBuffer<DrawUniforms> draw;
[[vk::binding(0, 2)]] Texture2D<float4> albedo_texture;
[[vk::binding(1, 2)]] SamplerState albedo_sampler;

struct VertexInput {
    float3 position : POSITION;
    float3 normal   : NORMAL;
    float2 texCoord : TEXCOORD0;
    float4 color    : COLOR0;
};

struct VertexOutput {
    float4 clipPosition : SV_Position;
    float3 worldNormal  : NORMAL;
    float3 worldPos     : TEXCOORD0;
    float2 texCoord     : TEXCOORD1;
    float4 vertexColor  : COLOR0;
};

struct GBufferOutput {
    float4 albedo   : SV_Target0;  // rgb = base_color, a = roughness
    float4 normal   : SV_Target1;  // rgb = packed normal, a = metallic
    float4 emission : SV_Target2;  // rgb = emission color, a = 0
};

[shader("vertex")]
VertexOutput vs_main(VertexInput input) {
    VertexOutput output;
    float4 worldPos = mul(draw.model_matrix, float4(input.position, 1.0));
    output.clipPosition = mul(camera.view_projection, worldPos);
    output.worldNormal = normalize(mul(draw.normal_matrix, float4(input.normal, 0.0)).xyz);
    output.worldPos = worldPos.xyz;
    output.texCoord = input.texCoord;
    output.vertexColor = input.color;
    return output;
}

[shader("fragment")]
GBufferOutput fs_main(VertexOutput input) {
    GBufferOutput output;
    float3 base = draw.base_color.rgb * input.vertexColor.rgb;
    if (draw.has_texture > 0.5) {
        float4 tex = albedo_texture.Sample(albedo_sampler, input.texCoord);
        base *= tex.rgb;
    }
    output.albedo = float4(base, draw.roughness);
    output.normal = float4(input.worldNormal * 0.5 + 0.5, draw.metallic);
    output.emission = float4(draw.emission.rgb, 0.0);
    return output;
}
