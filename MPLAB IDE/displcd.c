#include<pic.h>

#define rs RC0
#define rw RC1
#define en RC2
#define delay for(j=0;j<1000;j++)

int j;

void lcd_init();
void cmd(unsigned char a);
void dat(unsigned char b);
void show(unsigned char *s);


__CONFIG( FOSC_HS & WDTE_OFF & PWRTE_OFF & CP_OFF & BOREN_ON & LVP_OFF & CPD_OFF & WRT_OFF & DEBUG_OFF);

void main()
{
    unsigned int i;
    TRISD=TRISC0=TRISC1=TRISC2=0;
    lcd_init();
    cmd(0x80); 
    show("WELCOME TO IPCS");
    while(1) {
        for(i=0;i<15000;i++);
        cmd(0x18);
        for(i=0;i<15000;i++);
        
    }   
}

void lcd_init()
{
    cmd(0x38);
    cmd(0x0c);
    cmd(0x06);
    cmd(0x80);
}

void cmd(unsigned char a)
{
    PORTD=a;
    rs=0;
    rw=0;
    en=1;
    delay;
    en=0;
}

void dat(unsigned char b)
{
    PORTD=b;
    rs=1;
    rw=0;
    en=1;
    delay;
    en=0;
}

void show(unsigned char *s)
{
    while(*s) {
        dat(*s++);
    }
}