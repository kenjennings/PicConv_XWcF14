#include <stdio.h>
#include <stdlib.h>
/*#include <type.h>*/
#include <string.h>
#include <ctype.h>

#include "image.c"

typedef struct pixel
{
	char pixel_out;
	int  r;
	int  g;
	int  b;
} Pixel ;

char RGB2ASCII(int r, int g, int b);


int main(int argc, char ** argv)
{
	unsigned char * gpix = gimp_image.pixel_data;
	int             size = 160*96;
	char            cpix = ' ';
	int             x,y;
	int             r,g,b;

	/* Read three bytes from array.
	 * Find the pixel value.
	 * If the pixel value does not exist, then add new pixel.
	 * Output the pixel text value.
	 */

	for (y=0 ; y<96 ; y++)
	{
		for (x=0; x<160 ; x++)
		{
			r = (int) *gpix++;
			g = (int) *gpix++;
			b = (int) *gpix++;

			cpix = RGB2ASCII(r,g,b);

			if (cpix == '\0')
			{
				fprintf(stderr, "\nRGB2ASCII: R %d, G %d, B %d at X %d, Y%d is invalid or more than 16 colors\n\n",r, g, b, x, y) ;
				return -1;
			}

			fputc(cpix, stdout);
		}

		fputc('\n', stdout);
	}

	return 0;
}


Pixel pix[16] =
{
	{ ' ',-1,-1,-1 },
	{ 'A',-1,-1,-1 },
	{ 'B',-1,-1,-1 },
	{ 'C',-1,-1,-1 },
	{ 'D',-1,-1,-1 },
	{ 'E',-1,-1,-1 },
	{ 'F',-1,-1,-1 },
	{ 'G',-1,-1,-1 },
	{ 'H',-1,-1,-1 },
	{ 'I',-1,-1,-1 },
	{ 'J',-1,-1,-1 },
	{ 'K',-1,-1,-1 },
	{ 'L',-1,-1,-1 },
	{ 'M',-1,-1,-1 },
	{ 'N',-1,-1,-1 },
	{ 'O',-1,-1,-1 }
} ;
int max_pixels=0;


/* Ugly brute force stuff.
 * Traverse the list of remembered colors.
 * if the loop reaches an unused slot, then the search RGB values are the new pixel color.
 * if the loop reaches a matching slot, then return the pixel color.
 */
char RGB2ASCII(int r, int g, int b)
{
	char c = '\0';
	int i = 0;

	for ( i = 0 ; (i <= max_pixels) && ( !c ) ; i++ )
	{
		if ( pix[i].r == -1 )
		{
			pix[i].r = r;
			pix[i].g = g;
			pix[i].b = b;

			c = pix[i].pixel_out ;

			if ( ++max_pixels > 16)
				max_pixels = 16;
		}

		if ( ( pix[i].r == r ) &&
			 ( pix[i].g == g ) &&
			 ( pix[i].b == b ) )
			c = pix[i].pixel_out ;
	}


	return c;
}



