#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main()
{
	int i;
	pid_t cid = fork();
	if(cid < 0)
	{
		printf("error\n");
	}
	else if (cid > 0)
	{
		for(i = 0; i < 5; ++i)
		{
			printf("I am parent.\n");
			sleep(1);
		}
	}
	else
	{
		
		for(i = 0; i < 5; ++i)
		{
			printf("I am child.\n");
			sleep(1);
		}
	}

	return 0;
}
