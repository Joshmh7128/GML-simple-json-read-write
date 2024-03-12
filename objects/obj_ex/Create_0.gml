// this function places our ducks in our map
function place_ducks()
{
	// place 10 ducks in the space
	for (i = 0; i < 10; i++; )
	{
		// our space is 100 by 200, we need to place it at depth 10
		// make sure they are placed randomly within the space
		instance_create_depth(random_range(0, 100), random_range(0, -200), 10, obj_duck);
	}
}

// this function places our ducks in our map, using variables
duck_amount = 10; // how many ducks?
placement_bounds_x = 100; // how wide?
placement_bounds_y = -200; // how tall?
placement_depth = 10; // how deep?

function place_ducks()
{
	// place 10 ducks in the space
	for (i = 0; i < duck_amount; i++; )
	{
		// our space is 100 by 200, we need to place it at depth 10
		// make sure they are placed randomly within the space
		instance_create_depth(random_range(0, placement_bounds_x), random_range(0, -placement_bounds_y), placement_depth, obj_duck);
	}
}


// this function places our ducks in our map, using local variables
duck_amount = 10; // how many ducks?
placement_bounds_x = 100; // how wide?
placement_bounds_y = -200; // how tall?
placement_depth = 10; // how deep?

function place_ducks(_random_duck_amount)
{
	//is the duck amount random? if so, use duck_amount as a maximum, and randomize the number
	if (_random_duck_amount)
		duck_amount = random_range(1, duck_amount);
		
	// place 10 ducks in the space
	for (i = 0; i < duck_amount; i++; )
	{
		// our space is 100 by 200, we need to place it at depth 10
		// make sure they are placed randomly within the space
		instance_create_depth(random_range(0, placement_bounds_x), random_range(0, -placement_bounds_y), placement_depth, obj_duck);
	}
}


// this function reads our data from a file, finds the duck amount, and then sets it
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
	duck_amount = ds_map_find_value(info, "duck_amount")
	placement_bounds_x = ds_map_find_value(info, "placement_bounds_x")
	placement_bounds_y = ds_map_find_value(info, "placement_bounds_y")
	placement_depth = ds_map_find_value(info, "placement_depth")
}

// this function places our ducks in our map, using local variables
function place_ducks(_random_duck_amount)
{
	//is the duck amount random? if so, use duck_amount as a maximum, and randomize the number
	if (_random_duck_amount)
		duck_amount = random_range(1, duck_amount);
		
	// place 10 ducks in the space
	for (i = 0; i < duck_amount; i++; )
	{
		// our space is 100 by 200, we need to place it at depth 10
		// make sure they are placed randomly within the space
		instance_create_depth(random_range(0, placement_bounds_x), random_range(0, -placement_bounds_y), placement_depth, obj_duck);
	}
}


// read our data
read_data()

// place all our ducks
place_ducks(false);

// place a random amount of ducks
place_ducks(true);

