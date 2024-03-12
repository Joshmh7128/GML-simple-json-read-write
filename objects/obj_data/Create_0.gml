// this is the path we are using
path = working_directory;
// path = working_directory;

// our stats
hp = 10;
spd = 5;
time = 12;

var file;

// write data to a file using a DS map
function write_data()
{	
	// create our information data
	var _info_data = ds_map_create();
	// add our data
	ds_map_add(_info_data, "hp", hp);
	ds_map_add(_info_data, "spd", spd);
	ds_map_add(_info_data, "time", time);
	
	// data to string
	var _string_data = json_encode(_info_data);
	
	show_debug_message("encoded data:");
	show_debug_message(_string_data);
	
	// delete the data
	ds_map_destroy(_info_data);
	
	// write the data to the file
	var _file = file_text_open_write(path + "data.txt");
	file_text_write_string(_file, _string_data);
	file_text_close(_file);
}

// read the data
function read_data()
{
	if (!file_exists(path + "data.txt"))
	{
		show_debug_message("no file detected!");
		return;
	}
	
	var _file = file_text_open_read(path + "data.txt");
	// this decodes to a ds map
	var info = json_decode(file_text_read_string(_file));
	// set our variables from the ds map
	hp = ds_map_find_value(info, "hp")
	spd = ds_map_find_value(info, "spd")
	time = ds_map_find_value(info, "time")
	
	show_debug_message(hp);
	show_debug_message(spd);
	show_debug_message(time);
}

write_data();

read_data();
