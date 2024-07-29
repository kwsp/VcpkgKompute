#include <fmt/core.h>
#include <iostream>
#include <kompute/Kompute.hpp>
#include <memory>

int main(int argc, char *argv[]) {
  fmt::print("Hello, world!\n");

  kp::Manager mgr;

  std::shared_ptr<kp::TensorT<float>> tensorInA = mgr.tensor({2.0, 4.0, 6.0});
  std::shared_ptr<kp::TensorT<float>> tensorInB = mgr.tensor({0.0, 1.0, 2.0});
  std::shared_ptr<kp::TensorT<float>> tensorOut = mgr.tensor({0.0, 0.0, 0.0});

  const std::vector<std::shared_ptr<kp::Tensor>> params = {tensorInA, tensorInB,
                                                           tensorOut};

  return 0;
}
