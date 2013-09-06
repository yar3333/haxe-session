package haxe;

#if neko
private typedef HaxeSession = neko.Session;
#elseif php
private typedef HaxeSession = php.Session;
#end

class Session
{
	public static var gcStartChance(null, set_gcStartChance) : Float;
	static inline function set_gcStartChance(chance:Float) : Float
	{
		#if php
		// for PHP is not a possible to set this at runtime. See php.ini.
		#elseif neko
		HaxeSession.gcStartChance = chance;
		#end
		return chance;
	}
	
	public static var gcMaxLifeTime(null, set_gcMaxLifeTime) : Int;
	static inline function set_gcMaxLifeTime(seconds:Int) : Int
	{
		#if php
		// for PHP is not a possible to set this at runtime. See php.ini.
		#elseif neko
		HaxeSession.gcMaxLifeTime = seconds;
		#end
		return seconds;
	}
	
	public static var savePath(null, set_savePath) : String;
	static inline function set_savePath(path:String) : String
	{
		HaxeSession.setSavePath(path);
		return path;
	}
	
	public static inline function start()
	{
		HaxeSession.start();
	}
	
	public static inline function close()
	{
		HaxeSession.close();
	}
	
	public static inline function get(name:String) : Dynamic
	{
		return HaxeSession.get(name);
	}
	
	public static inline function set(name:String, value:Dynamic) : Void
	{
		HaxeSession.set(name, value);
	}
	
	public static inline function exists(name:String) : Bool
	{
		return HaxeSession.exists(name);
	}
	
	public static inline function remove(name:String)
	{
		HaxeSession.remove(name);
	}
	
	public static inline function clear()
	{
		HaxeSession.clear();
	}
}
