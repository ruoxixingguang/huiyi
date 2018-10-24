#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
#include<time.h>
#include<stdlib.h>
#define bool int
sem_t empty,full;
pthread_mutex_t mutex;
int in = 0;
int buffer[4];
int odd = 0;
int even = 0;
int suijishu;
int deletes(int next,int buffer[])
{
	printf("take the number out,print the buffer\n");
	if(in == 1)
	{
		printf("buffer null\n");
		in--;

	}
	else
	{
		int i = 0;
		for(;i<in;i++)
		{
			if(buffer[i] == next)
			{
				
				for(int j = i+1; j < in;j++)
				{
					buffer[j-1] = buffer[j];
			
				}
				in--;
				break;
			}
		}
		
		for(int i = 0; i < in; i++)
		{
			printf("%d   \n",buffer[i]);
		}	
	}

	return 1;
}
int produce()
{
	srand((unsigned int)time(NULL));
	 int i = rand()%9+1;//from 1 to 9 rand()%(e-s+1)+s;
	 
	 return i;
}
void put(int num)
{
	buffer[in++] = num;
	//cout<<"num = "<<num<<endl;
	printf("print the buffer\n");
	for(int i = 0; i < in; i++)
	{
		printf("%d   ",buffer[i]);
	}
	printf("\n");
}
bool getodd()
{
	bool flag = 0;
	for(int i = 0; i < in; i++)
	{
		if(buffer[i]%2 == 1)
		{
			printf("odd = %d\n",buffer[i]);
			flag = 1;
			deletes(buffer[i], buffer);
		    break;
		}			
	}
	return flag;
}

int countodd(bool odd)
{	
	int num = 0;
	if(odd)
		num = 1;
	return num;


}
bool geteven()
{
	bool flag = 0;
	for(int i = 0; i < in; i++)
	{
		if(buffer[i]%2 == 0)
		{
			flag = 1;
			printf("even = %d\n",buffer[i]);
			deletes(buffer[i], buffer);
		    break;
		}			
	}
	return flag;
}
int counteven(bool even)
{	
	int num = 0;
	if(even)
		num = 1;
	return num;


}
void *p1(void *arg){
	while(1){
		sem_wait(&empty);
		pthread_mutex_lock(&mutex);
		put(produce());
		pthread_mutex_unlock(&mutex);
		sem_post(&full);
	}		
}
void *c1(void *arg){
	
	while(1){
		sem_wait(&full);
		pthread_mutex_lock(&mutex);
		bool i = getodd();
		odd += countodd(i);
		printf("countodd = %d\n",odd);
		pthread_mutex_unlock(&mutex);
		sem_post(&empty);
	}
}
void *c2(void *arg){
	
	while(1){
		sem_wait(&full);
		pthread_mutex_lock(&mutex);
		bool i = geteven();
		even += counteven(i);
		printf("counteven = %d\n",even);
		pthread_mutex_unlock(&mutex);
		sem_post(&empty);
	}
}
int main(int argc,char *argv[]){
	pthread_t thread[3];
	pthread_mutex_init(&mutex,NULL);
	sem_init(&empty,0,4);
	sem_init(&full,0,0);
	while(1){
		if(pthread_create(&thread[0],NULL,p1,NULL)!=0)
		printf("thread create fail.");
	if(pthread_create(&thread[1],NULL,c1,NULL)!=0)
		printf("thread create fail.");
	if(pthread_create(&thread[2],NULL,c2,NULL)!=0)
		printf("thread create fail.");
	for(int i=0;i<3;i++){
		if( pthread_join( thread[i], NULL ) != 0 ) 
		 printf( " wait thread failed.");  
		
	}	
	}
	
}
