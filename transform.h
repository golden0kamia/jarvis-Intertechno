#include <math.h>

int ctoi(char *argv[])
{
	unsigned long int out = 0;
    int length = sizeof(argv);
    
    for(int i = 0;i < length; i++)
    {
		int power = length-1-i;
        if(argv[i] == '1')
        {
            out = out + (1*pow(10, power));
        }
        else if(argv[i] == '2')
        {
            out = out + (2*pow(10, power));
        }
        else if(argv[i] == '3')
        {
            out = out + (3*pow(10, power));
        }
        else if(argv[i] == '4')
        {
            out = out + (4*pow(10, power));
        }
        else if(argv[i] == '5')
        {
            out = out + (5*pow(10, power));
        }
        else if(argv[i] == '6')
        {
            out = out + (6*pow(10, power));
        }
        else if(argv[i] == '7')
        {
            out = out + (7*pow(10, power));
        }
        else if(argv[i] == '8')
        {
            out = out + (8*pow(10, power));
        }
        else if(argv[i] == '9')
        {
            out = out + (9*pow(10, power));
        }
        else if(argv[i] == '0')
        {
            out = out + (0*pow(10, power));
        }
    }
    return out;
}