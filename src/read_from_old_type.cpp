/*
https://en.cppreference.com/w/cpp/language/ub
Invalid scalar
*/

#include <cstdlib>
#include <iostream>

int main() {
  bool boolean = true;
  auto *const p_boolean = reinterpret_cast<unsigned char *>(&boolean);
  *p_boolean = 10;
  // reading from b is now UB
  const bool out_bool = boolean;
  std::cout << out_bool << std::endl;
  return EXIT_SUCCESS;
}
