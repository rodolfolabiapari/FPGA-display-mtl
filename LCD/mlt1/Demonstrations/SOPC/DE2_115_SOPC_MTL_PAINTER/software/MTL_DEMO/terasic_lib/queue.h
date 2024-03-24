// --------------------------------------------------------------------
// Copyright (c) 2011 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------


#ifndef QUEUE_H_
#define QUEUE_H_


typedef struct{
    alt_u32 num;
    alt_u32 front;
    alt_u32 rear;
    alt_u32 data[0];
    alt_u32 mydata[2]; // custom data
}QUEUE_STRUCT;

QUEUE_STRUCT* QUEUE_New(int nQueueNum);
void QUEUE_Delete(QUEUE_STRUCT *pQueue);
bool QUEUE_IsEmpty(QUEUE_STRUCT *pQueue);
bool QUEUE_IsFull(QUEUE_STRUCT *pQueue);
bool QUEUE_Push(QUEUE_STRUCT *pQueue, alt_u32 data32);
alt_u32 QUEUE_Pop(QUEUE_STRUCT *pQueue);
void QUEUE_Empty(QUEUE_STRUCT *pQueue);

#endif /*QUEUE_H_*/
