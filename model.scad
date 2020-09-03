/*
The MIT License (MIT)

Copyright (c) Aleksandr Meniailo (Александр Меняйло), Mendeo 2020 (deorathemen@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

$fn = 200;
#squircleCube(20, 30, 5, 50);
roundedCube(20, 30, 6, 50);

//x - size along the X-axis
//y - size along the Y-axis
//n - power of rounding by changing the parameter n. Then greater the n - then less the power of rounding
//h - height of the object
module squircleCube(x, y, n, h)
{
	points = [ for (i = [0 : $fn])
		let(
			t = i / $fn, //t from 0 to 1
			xVal = xFromT(t, x),
			isUp = t < 0.25 || t >= 0.75 ? true : false,
			yVal = squircle(xVal, x, y, isUp))
			//echo(t, xVal, yVal)
			[xVal, yVal] ];
	
	translate([x / 2, y / 2, 0])
	linear_extrude(height = h)
	polygon(points);
	
	function squircle(x, xSize, ySize, isUp) = 
	isUp ? squirclePart(x, xSize, ySize) : -squirclePart(x, xSize, ySize);

	function squirclePart(x, xSize, ySize) =
	(ySize / 2) * pow(1 - pow(abs(x) / (xSize / 2), n), 1 / n);
	
	function xFromT(t, xSize) =
	t < 0.25 ? xSize * 2 * t :
	(t >= 0.25 && t < 0.5 ? xSize * 2 * (0.5 - t) :
	(t >= 0.5 && t < 0.75 ? -xSize * 2 * (t - 0.5) :
	-xSize * 2 * (1 - t)));
}


//x - size along the X-axis
//y - size along the Y-axis
//r - radius of rounding
//h - height of the cube
module roundedCube(x, y, r, h)
{
	linear_extrude(height = h)
	render()
	difference()
	{
		square([x, y]);
		difference()
		{			
			square([x, y]);
			
			translate([0, r])
			square([x, y - 2 * r]);
			
			translate([r, 0])
			square([x - 2 * r, y]);
			
			translate([r, r])
			circle(r = r);
			
			translate([r, y - r])
			circle(r = r);
					
			translate([x - r, r])
			circle(r = r);
			
			translate([x - r, y - r])
			circle(r = r);
		}
	}
}