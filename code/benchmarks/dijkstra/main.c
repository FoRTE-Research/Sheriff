#include <msp430.h>
#include <stdlib.h>
#include "../bareBench.h"

#include "dijkstra.h"
#include "../../secure-gateway/gateway.h"

int shortest_distance;

int main(int argc, char *argv[]) {
  shortest_distance = dijkstraFunc(12,37);
  return 0;
}
