#version 460 core

precision highp float;

#include <flutter/runtime_effect.glsl>

uniform vec2 uMosaicSize;   // 马赛克块的大小
uniform float uSampleCount; // 采样数量
uniform vec2 uSize;         // 输入尺寸
uniform sampler2D uTexture; // 输入纹理

out vec4 fragColor;

// 计算马赛克区域内采样的颜色
vec4 getSampleColor(
    // 马赛克块内采样点的索引位置
    vec2 sampleIndex,
    // 马赛克块在纹理坐标中的最小坐标
    vec2 mosaicMin,
    // 马赛克块在纹理坐标中的尺寸
    vec2 mosaicSizeInTextureCoord,
    // 马赛克块内的采样数量
    float textureSampleCount

) {
  // 当前采样点的具体纹理坐标:
  // mosaicMin + 采样点的索引位置 * 马赛克块在纹理坐标中的大小 / 划分区域的数量
  vec2 sampleUV =
      mosaicMin + sampleIndex * mosaicSizeInTextureCoord / textureSampleCount;
  return texture(uTexture, sampleUV);
}

// 将整个区域按照马赛克块大小 (uMosaicSize) 划分区域，
// 每个区域内的像素都采用相同的取样颜色来近似代表整个区域的颜色。
//
// 确定每个像素在哪个马赛克块。
// 根据采样数量 (uSampleCount)，均匀取样多个点的颜色。
// 最终近似代表某个区域的颜色 = 区域内所有取样颜色总和的平均值。
void main() {
  // 当前片元在屏幕上的坐标
  vec2 fragCoord = FlutterFragCoord().xy;

  // 计算当前片元在马赛克块中的位置
  vec2 mosaicCoord = floor(fragCoord / uMosaicSize);

  // 计算马赛克块的纹理坐标范围
  vec2 mosaicMin = mosaicCoord * uMosaicSize / uSize;
  vec2 mosaicMax = (mosaicCoord + vec2(1.0)) * uMosaicSize / uSize;
  // 马赛克块在纹理坐标中的尺寸
  vec2 mosaicSizeInTextureCoord = mosaicMax - mosaicMin;

  // 对马赛克块内的一个区域进行一次纹理采样，获取平均颜色
  vec4 mosaicColor = vec4(0.0);
  // TODO: 采样数量无法预处理为常量，暂时采用固定数量
  if (uSampleCount == 1.0) {
    // 采样的数量 1
    const float textureSampleCount = 1.0;
    for (float x = 0.0; x < textureSampleCount; ++x) {
      for (float y = 0.0; y < textureSampleCount; ++y) {
        mosaicColor +=
            getSampleColor(vec2(x, y), mosaicMin, mosaicSizeInTextureCoord,
                           textureSampleCount);
      }
    }
  }
  if (uSampleCount == 2.0) {
    // 采样的数量 2
    const float textureSampleCount = 2.0;
    for (float x = 0.0; x < textureSampleCount; ++x) {
      for (float y = 0.0; y < textureSampleCount; ++y) {
        mosaicColor +=
            getSampleColor(vec2(x, y), mosaicMin, mosaicSizeInTextureCoord,
                           textureSampleCount);
      }
    }
  }
  if (uSampleCount == 4.0) {
    // 采样的数量 4
    const float textureSampleCount = 4.0;
    for (float x = 0.0; x < textureSampleCount; ++x) {
      for (float y = 0.0; y < textureSampleCount; ++y) {
        mosaicColor +=
            getSampleColor(vec2(x, y), mosaicMin, mosaicSizeInTextureCoord,
                           textureSampleCount);
      }
    }
  }
  if (uSampleCount == 8.0) {
    // 采样的数量 8
    const float textureSampleCount = 8.0;
    for (float x = 0.0; x < textureSampleCount; ++x) {
      for (float y = 0.0; y < textureSampleCount; ++y) {
        mosaicColor +=
            getSampleColor(vec2(x, y), mosaicMin, mosaicSizeInTextureCoord,
                           textureSampleCount);
      }
    }
  }
  // 计算颜色平均值
  mosaicColor /= uSampleCount * uSampleCount;

  // 输出
  fragColor = mosaicColor;
}