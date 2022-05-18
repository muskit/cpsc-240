// Name: REDACTED
// Section: CPSC 240-07
// E-mail: REDACTED

#include <cstdio>

// change type as needed for assignment
extern "C" double electric();

int main()
{
    printf("[Final exam response for CPSC 240-07 by REDACTED.]\n");
    printf("---------- Electric Calculations ----------\n");
    double ret = electric();
    printf("--------------- END ASSEMBLY ---------------\n");
    
    // change format-specifier as needed for assignment
    printf("\nReceived %lf from electric()\n", ret);
    printf("Returning succcess code 0 to OS\n");

    return 0;
}