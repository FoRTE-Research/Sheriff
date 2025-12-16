#include <msp430.h>
#include <stdlib.h>
#include "dijkstra.h"
#include "input.h"

/*
 * Dijkstra's algorithm calculates the shortest path between two nodes
 * by calculating the shortest path from 1 node to all the other nodes.
 * At the Nth step, the algorithm "visits" the closest node to
 * any of the N already visited nodes.
 * Then, the algorithm checks the (NUM_NODES - N) unvisited nodes and
 * adds a node to the queue if a shorter path to that node is found.
 * Thus, the maximum number of nodes that could be added to the queue is
 * NUM_NODES + (NUM_NODES - 1) + ... + 2 + 1 ~= (NUM_NODES * NUM_NODES / 2)
 */
#define ARRAY_SIZE (NUM_NODES * NUM_NODES / 2)
QITEM allocated[ARRAY_SIZE] __attribute__((section(".secure_vars")));
QITEM *qHead __attribute__((section(".secure_vars"))) = NULL;
int notAll __attribute__((section(".secure_vars"))) = 0;

int g_qCount __attribute__((section(".secure_vars"))) = 0;
NODE rgnNodes[NUM_NODES] __attribute__((section(".secure_vars")));
int ch __attribute__((section(".secure_vars")));
int iPrev __attribute__((section(".secure_vars")));
int iNode __attribute__((section(".secure_vars")));
int i __attribute__((section(".secure_vars")));
int iCost __attribute__((section(".secure_vars")));
int iDist __attribute__((section(".secure_vars")));

//int spcount __attribute__((section(".secure_vars")));
//int shortest_path[100] = {x32, x32, x32, x4};                            //will be stored in normal world

//void get_path (NODE *rgnNodes, int chNode)
//{
  //if (rgnNodes[chNode].iPrev != NONE)
    //{
      //get_path(rgnNodes, rgnNodes[chNode].iPrev);
    //}
  //shortest_path[spcount] = chNode;
  //spcount++;
//}

QITEM *qNew __attribute__((section(".secure_vars")));
QITEM *qLast __attribute__((section(".secure_vars")));

void enqueue (int iNode, int iDist, int iPrev)
{
  qNew = &allocated[notAll];
  notAll++;
  qLast = qHead;
  
  if (notAll >= ARRAY_SIZE) 
    {
      //printf("Out of memory.\r\n");
      exit(1);
    }
  qNew->iNode = iNode;
  qNew->iDist = iDist;
  qNew->iPrev = iPrev;
  qNew->qNext = NULL;
  
  if (!qLast) 
    {
      qHead = qNew;
    }
  else
    {
      qLast = &allocated[notAll-2];
      qLast->qNext = qNew;
    }
  g_qCount++;
  //ASSERT(g_qCount);
}

QITEM *qKill __attribute__((section(".secure_vars")));

void dequeue (int *piNode, int *piDist, int *piPrev)
{
  qKill = qHead;
  
  if (qHead)
    {
      //ASSERT(g_qCount);
      *piNode = qHead->iNode;
      *piDist = qHead->iDist;
      *piPrev = qHead->iPrev;
      qHead = qHead->qNext;
      //free(qKill);
      g_qCount--;
    }
}


int qcount (void)
{
  return(g_qCount);
}

int dijkstraFunc(int chStart, int chEnd) 
{
  notAll = 0;

  for (ch = 0; ch < NUM_NODES; ch++)
    {
      rgnNodes[ch].iDist = NONE;
      rgnNodes[ch].iPrev = NONE;
    }
  if (chStart == chEnd) 
    {
      return 0;
    }
  else
    {
      rgnNodes[chStart].iDist = 0;
      rgnNodes[chStart].iPrev = NONE;
      enqueue (chStart, 0, NONE);

     while (qcount() > 0)
	{
	  dequeue (&iNode, &iDist, &iPrev);
	  for (i = 0; i < NUM_NODES; i++)
	    {
	      if ((iCost = AdjMatrix[iNode][i]) != NONE)
		{
		  if ((NONE == rgnNodes[i].iDist) || 
		      (rgnNodes[i].iDist > (iCost + iDist)))
		    {
		      rgnNodes[i].iDist = iDist + iCost;
		      rgnNodes[i].iPrev = iNode;
		      enqueue (i, iDist + iCost, iNode);
		    }
		}
	    }
	}
	    //spcount = 0;
	    //get_path(rgnNodes, chEnd);
    }
    return rgnNodes[chEnd].iDist;
}
