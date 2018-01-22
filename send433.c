#include <wiringPi.h>
#include <stdio.h>

char pin = 4;
int i = 0;
int time;

void sendStartPulse();
void sendAdress(int adress);
void sendUnit(int unit);
void sendStopPulse();
void sendBit(char bitsend);

int main(int argc, char *argv[])
{
	wiringPiSetupGpio();
	pinMode(pin, OUTPUT);
	int adress = 13709258;
	int status = $argv[2];
	int unit   = 0;
	time  = 253;
	printf("adress:%s\nstatus:%s\nunit:%s\ntime:%s\n", adress, status, unit, time);
	for (int y = 0; y < 4; y++)
	{
		sendStartPulse();
		sendAdress(adress);
		sendBit(0);
		sendBit(status);
		sendUnit(unit);
		sendStopPulse();
	}
}

void sendStartPulse()
{
	digitalWrite(pin, HIGH);
	delayMicroseconds(time);
	digitalWrite(pin, LOW);
	delayMicroseconds(time * 10 + (time >> 1));
}

void sendAdress(int adress)
{
	for (i = 25; i>=0; i--)
	{
		sendBit((adress >> i) & 1);
	}
}

void sendUnit(int unit)
{
	for (i = 3; i>=0; i--)
	{
		sendBit((unit >> i) & 1);
	}
}

void sendStopPulse()
{
	digitalWrite(pin, HIGH);
	delayMicroseconds(time);
	digitalWrite(pin, LOW);
	delayMicroseconds(time * 40);
}

void sendBit(char bitSend)
{
	if (bitSend)
	{
		digitalWrite(pin, HIGH);
		delayMicroseconds(time);
		digitalWrite(pin, LOW);
		delayMicroseconds(time * 5);
		digitalWrite(pin, HIGH);
		delayMicroseconds(time);
		digitalWrite(pin, LOW);
		delayMicroseconds(time);
	} else {
		digitalWrite(pin, HIGH);
		delayMicroseconds(time);
		digitalWrite(pin, LOW);
		delayMicroseconds(time);
		digitalWrite(pin, HIGH);
		delayMicroseconds(time);
		digitalWrite(pin, LOW);
		delayMicroseconds(time * 5);
	}
}
