//Librairy to convert char array/string number to a integer value
//Creator Bastien Piguet @Golden0kamia

#include <math.h>
#include <string.h>

unsigned long int ctoi(char input[])
{
	unsigned long int out = 0;
    int length = strlen(input);
    
    for(int i = 0;i < length; i++)
    {
		int power = length-1-i;
        if(input[i] == '1')
        {
            out = out + (1*pow(10, power));
        }
        else if(input[i] == '2')
        {
            out = out + (2*pow(10, power));
        }
        else if(input[i] == '3')
        {
            out = out + (3*pow(10, power));
        }
        else if(input[i] == '4')
        {
            out = out + (4*pow(10, power));
        }
        else if(input[i] == '5')
        {
            out = out + (5*pow(10, power));
        }
        else if(input[i] == '6')
        {
            out = out + (6*pow(10, power));
        }
        else if(input[i] == '7')
        {
            out = out + (7*pow(10, power));
        }
        else if(input[i] == '8')
        {
            out = out + (8*pow(10, power));
        }
        else if(input[i] == '9')
        {
            out = out + (9*pow(10, power));
        }
        else if(input[i] == '0')	//does nothing just to not return a error;
        {
        }
        else
        {
            return -1;
        }
    }
    return out;
}