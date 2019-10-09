/*	Author: hhuyn019
 *  Partner(s) Name: 
 *	Lab Section:
 *	Assignment: Lab #  Exercise #
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF;
	DDRB = 0x00; PORTB = 0xFF;
	DDRC = 0xFF; PORTC = 0x00;
	unsigned char tmpA = 0x00;
	unsigned char tmpB = 0x00;
	//unsigned char tmpC = 0x00;
	unsigned char count = 0x00;
	unsigned char tempCount = 0x00;
    /* Insert your solution below */
    while (1) {
	tmpA = PINA;
	tmpB = PINB;
	//for (unsigned char i = 0x00; i < 0x08; i = i + 0x01) {
	unsigned char i = 0x00;
	while (i < 0x08) {
		tmpA = tmpA >> i;
		tempCount = tmpA & 0x01;
		if (tempCount == 0x01) {
			count = count + 0x01;
		}
		i = i + 0x01;
	}
	i = 0x00;
	//for (unsigned char u = 0x00; u < 0x08; u = u + 0x01) {
	unsigned char u = 0x00;
	while (u < 0x08) {
		tmpB = tmpB >> u;
		tempCount = tmpB & 0x01;
		if (tempCount == 0x01) {
			count = count + 0x01;
		}
		u = u + 0x01;
	}
	u = 0x00;
	PORTC = count;
    }
    return 1;
}
