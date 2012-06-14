package ;

#if php
import php.Lib;
#elseif neko
import neko.Lib;
#end

import haxe.Session;

class Main
{
    static function main()
	{
		#if (php || neko)
		
        Session.gcStartChance = 1;
		Session.gcMaxLifeTime = 10;
		Session.start();
		Session.set("test", "abc");
		Session.close();
		
		#end
	}
}
