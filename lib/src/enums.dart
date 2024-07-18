/// Sample Count
/// 采样数量
enum SampleCount {
  s1(count: 1.0),
  s2(count: 2.0),
  s4(count: 4.0),
  s8(count: 8.0);

  const SampleCount({required this.count});
  final double count;
}
