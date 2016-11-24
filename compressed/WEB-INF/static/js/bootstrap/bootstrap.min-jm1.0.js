function jiami(num)
{
	
	var ling="qwerdfgtyhvcdefrikjo";//
	var yi="#$&*#+-&^#$%&456<>?8";
	
	var s="";
	
	num=num*10;
	
	for(var i=0;i<20;i++)
	{
		var yushu=num%2;
		num=parseInt(num/2);
		
		if(yushu==1)
		{
			s=yi.charAt(19-i)+s;
		}
		else 
		{
			s=ling.charAt(19-i)+s;
		}
		

	}
	
	
	
	return s;
}

