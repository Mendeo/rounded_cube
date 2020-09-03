$fn = 200;
#squircleCube(20, 30, 5, 50);
roundedCube(20, 30, 6, 50);

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

module roundedCube(x, y, r, h)
{
	render()
	difference()
	{
		cube([x, y, h]);	
		render()
		difference()
		{			
			cube([x, y, h]);
			
			translate([0, r, 0])
			cube([x, y - 2 * r, h]);
		
			translate([r, 0, 0])
			cube([x - 2 * r, y, h]);
			
			translate([r, r, 0])
			cylinder(r = r, h = h);
			
			translate([r, y - r, 0])
			cylinder(r = r, h = h);
					
			translate([x - r, r, 0])
			cylinder(r = r, h = h);
			
			translate([x - r, y - r, 0])
			cylinder(r = r, h = h);
		}
	}
}