#ifndef DIJKSTRA_H
#define DIJKSTRA_H

#define NUM_NODES                          40
#define NONE                               9999

#define x1      0xFFFF
#define x2      x1, x1
#define x4      x2, x2
#define x8      x4, x4
#define x16     x8, x8
#define x32     x16, x16

struct _NODE
{
  int iDist;
  int iPrev;
};
typedef struct _NODE NODE;

struct _QITEM
{
  int iNode;
  int iDist;
  int iPrev;
  struct _QITEM *qNext;
};
typedef struct _QITEM QITEM;

//__attribute__((section(".secure_code"))) void get_path (NODE *rgnNodes, int chNode);
__attribute__((section(".secure_code"))) void enqueue (int iNode, int iDist, int iPrev);
__attribute__((section(".secure_code"))) void dequeue (int *piNode, int *piDist, int *piPrev);
__attribute__((section(".secure_code"))) int qcount (void);
__attribute__((section(".secure_code"))) int dijkstraFunc(int chStart, int chEnd);

#endif
