if (keyboard_check_pressed(ord("R")))
{
	read_data()
}

if (keyboard_check_pressed(ord("W")))
{
	write_data()
	read_data()
}

if (keyboard_check_direct(vk_up))
{
	spd++;	
}

if (keyboard_check_direct(vk_down))
{
	spd--;	
}
	